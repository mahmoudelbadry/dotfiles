set number
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"vundle bundle
Bundle 'gmarik/vundle'

"bundles
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'walm/jshint.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/javacomplete'
Bundle 'bling/vim-airline'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "groenewege/vim-less"
Bundle "joonty/vdebug"
Bundle "kien/ctrlp.vim"
Bundle "jiangmiao/auto-pairs"
Bundle "scrooloose/nerdcommenter"
Bundle "editorconfig/editorconfig-vim"
Bundle "ervandew/supertab"
Bundle "sickill/vim-monokai"
Bundle "tpope/vim-vinegar"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "wting/rust.vim"
Bundle "tpope/vim-surround"
Bundle "marijnh/tern_for_vim"

"settings
filetype plugin indent on
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

" Local dirs
set noswapfile
set nobackup
set undodir=~/.vim/undo

let mapleader=','

"VDebug settings
let g:vdebug_options= {
    \ "port" : 9000,
    \ "server" : 'localhost',
    \ "timeout" : 5000,
    \ "on_close" : 'detach',
    \ "break_on_open" : 0,
    \ "ide_key" : 'root',
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
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_buftag_types = {
\ 'rust' : '--language-force=rust --rust-types=fTm',
\ }
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '~/local/bin/jsctags'
    \ }

"Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

set guioptions-=T
set guioptions-=m
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

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
nnoremap <leader>n :cn <CR>
nnoremap <leader>p :cp <CR>
nnoremap <leader>b :TagbarToggle<CR>
autocmd FileType javascript nnoremap <leader>j :JSHint<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
map <C-s> :w <CR>
map <C-n> :NERDTreeToggle<CR>
map <C-m> :CtrlPBufTag<CR>
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <C-F9> :call NumberToggle()<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap b[ :bp<CR>
nnoremap b] :bn<CR>
nnoremap b# :b#<CR>

if executable('ag')
      " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
      "     " Use ag in CtrlP for listing files. Lightning fast and respects
      "     .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
