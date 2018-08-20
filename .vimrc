"""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
" Install plugins with ':PlugInstall'
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" General-use plugins
"Plug 'tpope/vim-sensible'
"Plug 'jeetsukumaran/vim-filebeagle'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'

" Programming plugins
Plug 'tpope/vim-commentary'
"Plug 'junegunn/vim-easy-align'

" Writing plugins
"Plug 'reedes/vim-pencil'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

" Language-specific plugins
"Plug 'mxw/vim-jsx'
"Plug 'cespare/vim-toml'
"Plug 'vim-ruby/vim-ruby'
Plug 'OrangeT/vim-csharp'
"Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
"Plug 'hail2u/vim-css3-syntax'


" Colorschemes
Plug 'joshdick/onedark.vim'

" Marwen Plugins
Plug 'valloric/youcompleteme'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'townk/vim-autoclose'
Plug 'vim-airline/vim-airline-themes'

"GOOD BASE https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
Plug 'tpope/vim-surround'
"Plugin 'airblade/vm-gitgutter'
"Plugin 'editorconfig/editorconfig-vim' 
"Plugin 'itchyny/lightline.vim' 
"Plugin 'junegunn/fzf' 
"Plugin 'junegunn/fzf.vim' 
"Plug 'mattn/emmet-vim' 
Plug 'scrooloose/nerdtree' 
"Plugin 'terryma/vim-multiple-cursors' 
"Plugin 'tpope/vim-eunuch' 
"Plugin 'w0rp/ale'


call plug#end()


""""""""""""""""""""""""""""""""""""""""""
" MARWEN SETTINGS
""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. 
let g:UltiSnipsExpandTrigger="<c-space>" 
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Highlight cursor line
set cursorline

set t_Co=256

" CTRL-O for Nerdtree
map <C-o> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on 

set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set breakindent

set number

set ignorecase smartcase
set incsearch

set ttyfast
set lazyredraw

set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_detect_whitespace = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_theme = ''

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-pencil
"let g:pencil#wrapModeDefault = 'soft'

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 50

" RLS
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
    let g:ale_linters = {'rust': ['rls']}
endif 

""""""""""""""""""""""""""""""""""""""""""
" THEME SETTINGS
""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark

" Windows has different font syntax
if has("win32") || has("win64")
    set guifont=Hack:h9:cANSI
    set rop=type:directx,geom:1,taamode:1
    set enc=utf-8
endif

""""""""""""""""""""""""""""""""""""""""""
" OS-SPECIFIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""
" Enable DirectX font rendering on Windows
if has("directx") && $VIM_USE_DIRECTX != '0'
  set renderoptions=type:directx,geom:1,taamode:1
endif

" Fix input mode cursor in terminal. 
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q" 
let &t_EI.="\e[1 q"

""""""""""""""""""""""""""""""""""""""""""
" KEYMAPS
""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

inoremap jj <esc>

nnoremap <leader><leader> .

" Create splits with leader
nnoremap <leader>s <C-W>v
nnoremap <leader>h <C-W>s

" Rotate between splits
nnoremap <leader>w <c-W>w

" Move around tabs with <S-jk>
nmap <S-j> <c-PageDown>
nmap <S-k> <c-PageUp>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-W>j
nnoremap <c-k> <c-W>k
nnoremap <c-h> <c-W>h
nnoremap <c-l> <c-W>l

" Move lines of code around with ctrl-arrows
nnoremap <silent> <c-Up>   :<C-u>move-2<CR>==
nnoremap <silent> <c-Down> :<C-u>move+<CR>==
xnoremap <silent> <c-Up>   :move-2<CR>gv=gv
xnoremap <silent> <c-Down> :move'>+<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""
" AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""
augroup disablebells
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=
augroup END
