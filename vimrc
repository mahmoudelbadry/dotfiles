set number
set nocompatible
filetype off
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/')) 

"vundle bundle
" Plugin 'gmarik/vundle'
NeoBundleFetch 'Shougo/neobundle.vim'

"plugins
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'taglist.vim'
NeoBundle 'walm/jshint.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'bling/vim-airline'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'groenewege/vim-less'
NeoBundle 'joonty/vdebug'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'wting/rust.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'triglav/vim-visual-increment'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'etaoins/vim-volt-syntax'
NeoBundle 'mahmoudelbadry/vim-snippets', {'rev': 'my-snippets'}
NeoBundle 'christoomey/vim-tmux-navigator'
call neobundle#end()
"settings
filetype plugin on
filetype plugin indent on
set t_Co=256
syntax on 
set background=dark
colorscheme monokai 
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set iskeyword-=_
set hidden
set relativenumber
let g:instant_markdown_autostart = 0
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

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>a gg=G''
autocmd FileType javascript nnoremap <leader>j :JSHint<CR>
autocmd FileType volt set commentstring={#\ %s\ #}
autocmd FileType php set commentstring=//\ %s
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
map <C-s> :w <CR>
inoremap <C-s> <ESC>:w<CR>a
map <C-n> :NERDTreeToggle<CR>
map <C-m> :CtrlPBufTag<CR>
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

if executable('ag')
      " Use ag over grep
    set grepprg=agi
      "     " Use ag in CtrlP for listing files. Lightning fast and respects
      "     .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

