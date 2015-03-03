set number
set nocompatible
filetype off
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=0
call plug#begin('~/.nvim/plugged')

"plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'taglist.vim'
Plug 'walm/jshint.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/javacomplete'
Plug 'bling/vim-airline'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Valloric/YouCompleteMe' , {'do': './install.sh'}
Plug 'groenewege/vim-less'
Plug 'joonty/vdebug', {'branch': 'dev'}
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'wting/rust.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'marijnh/tern_for_vim'
Plug 'triglav/vim-visual-increment'
Plug 'sheerun/vim-polyglot'
Plug 'etaoins/vim-volt-syntax'
Plug 'mahmoudelbadry/vim-snippets', {'branch': 'my-snippets'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
call plug#end()
"settings
filetype plugin on
filetype plugin indent on
set t_Co=256
set bs=eol,indent,start
syntax enable 
set background=dark
colorscheme monokai 
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set iskeyword-=_
set hidden
set relativenumber
let g:livedown_autostart = 0
let g:livedown_port = 1337
" Local dirs
set noswapfile
set nobackup
set undodir=~/.vim/undo
set mouse=a

let mapleader=','

"VDebug settings
let g:vdebug_options= {
    \ "port" : 9001,
    \ "server" : 'localhost',
    \ "timeout" : 5000,
    \ "on_close" : 'detach',
    \ "break_on_open" : 0,
    \ "continuous_mode" : 1,
    \ "ide_key" : 'netbeans-xdebug',
    \ "path_maps" : {},
    \ "debug_window_level" : 0,
    \ "debug_file_level" : 0,
    \ "debug_file" : "",
    \ "watch_window_style" : 'expanded',
    \ "marker_default" : '⬦',
    \ "marker_closed_tree" : '▸',
    \ "marker_open_tree" : '▾'
    \}

"CtrlP settings
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_buftag_types = {
\ 'rust' : '--language-force=rust --rust-types=fTm',
\ }
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '~/local/bin/jsctags'
    \ }

"Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='wombat'
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-1>"
let g:UltiSnipsJumpBackwardTrigger="<C-2>"
" let g:UltiSnipsSnippetsDir="~/.nvim"
set guioptions-=T
set guioptions-=m
"functions
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

"Mappings
nnoremap <leader>k :grep! "\b<C-R><C-W>\b":cw<CR>
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>a gg=G''
nnoremap <leader>dd "_dd
autocmd FileType javascript nnoremap <leader>j :JSHint<CR>
" autocmd FileType jasmine.javascript set commentstring=//\ %s
autocmd FileType volt set commentstring={#\ %s\ #}
autocmd FileType php set commentstring=//\ %s
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
map <C-s> :w <CR>
inoremap <C-s> <ESC>:w<CR>a
map <C-f> :NERDTreeToggle<CR>
map <C-m> :CtrlPBufTag<CR>
nnoremap <leader>m zf%
nnoremap <leader>v :tabe $MYVIMRC<CR>
nnoremap <C-F9> :call NumberToggle()<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap b[ :bp<CR>
nnoremap b] :bn<CR>
nnoremap b# :b#<CR>
nnoremap <C-Tab> gt
nnoremap <S-Tab> gT
map gm :call LivedownPreview()<CR>

if executable('ag')
      " Use ag over grep
    set grepprg=agi
      "     " Use ag in CtrlP for listing files. Lightning fast and respects
      "     .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:python_host_prog='/usr/bin/python'
