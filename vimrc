setglobal fileencoding=utf-8
set number
set t_Co=256
set nocompatible
filetype off
set splitbelow
set splitright
set backspace=indent,eol,start
if has("win32")
    call plug#begin('$HOME\vim\plugged')
elseif has("nvim")
    call plug#begin('$HOME/.config/nvim/plugged')
else
    call plug#begin('$HOME/.vim/plugged')
endif

"plugins
Plug 'vim-scripts/taglist.vim'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'tomtom/tlib_vim'
Plug 'joonty/vdebug', {'branch': 'dev'}
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
Plug 'Valloric/MatchTagAlways'
Plug 'jbgutierrez/vim-partial'
Plug 'benjaminwhite/Benokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'Quramy/vim-js-pretty-template'
Plug 'junegunn/vim-peekaboo'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'junegunn/vim-easy-align'
if has("win32")
    Plug 'ctrlpvim/ctrlp.vim'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mahmoudelbadry/vim-snippets', {'branch': 'my-snippets'}
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'airblade/vim-gitgutter'
    " Plug 'SirVer/ultisnips'
    Plug 'junegunn/fzf.vim'
endif
if !has("nvim")
    Plug 'dermusikman/sonicpi.vim'
else
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --java-completer' }
endif
call plug#end()
set t_Co=256
set ttimeout
set ttimeoutlen=0
set lazyredraw
set nobomb
set ignorecase
set smartcase
let g:python3_host_prog='/usr/bin/python3'
"settings
filetype plugin on
filetype plugin indent on
set background=dark
colorscheme Benokai
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set iskeyword-=_
set hidden
set relativenumber
let g:livedown_autostart = 0
let g:livedown_port = 1337
hi Normal guibg=NONE ctermbg=NONE
" Local dirs
set noswapfile
set nobackup
set undodir=~/.vim/undo
set mouse=a
if has("gui_running")
       set guifont=Hack:h10:cANSI
endif

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

let g:peekaboo_window = 'vertical botright 80new'
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '~/local/bin/jsctags'
    \ }

"Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'
" let g:airline_theme='wombat'
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-1>"
let g:UltiSnipsJumpBackwardTrigger="<C-2>"
" let g:UltiSnipsSnippetsDir="~/.nvim"
set guioptions-=T
set guioptions-=m
set iskeyword-=_
let g:gitgutter_max_signs = 5000
"functions
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

"Mappings
if has("win32")
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_buftag_types = {
                \ 'rust' : '--language-force=rust --rust-types=fTm',
                \ }
    let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
else
    map <C-p> :Files<CR>
    map <C-m> :BTags<CR>
endif
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
nnoremap <leader>m zf%
nnoremap <leader><leader>v :e $MYVIMRC<CR>
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
nnoremap <leader>p "+p
vnoremap <leader>p "+p
map gm :call LivedownPreview()<CR>

let g:python_host_prog='/usr/bin/python'
nmap <leader>f :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
hi! link htmlTag Function
hi! link htmlTagName Statement
hi! link htmlEndTag Identifier
hi! link htmlArg Type
let g:sneak#streak = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'volt' : 1,
    \}
let g:partial_templates = {
      \   'volt': '{% include %s %}',
      \ }
let g:gitgutter_override_sign_column_highlight = 0
if has("nvim")
    nnoremap <leader>tt :terminal<CR>
    tnoremap <leader>p "+p
    tnoremap <M-a> <C-\><C-n>
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-l> <C-\><C-n><C-w>l
    nnoremap <leader>ts :split<CR>:terminal<CR>
    nnoremap <leader>tv :vsplit<CR>:terminal<CR>
    nnoremap <leader>s :split<CR>
    nnoremap <leader>v :vsplit<CR>
    inoremap <M-c> <ESC>j0a
    nnoremap <M-c> <ESC>j0a
    autocmd TermOpen * :set number
    autocmd TermOpen * :set relativenumber
    set guicursor=
endif
function! AirlineInit()
    let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()
if g:colors_name == "Benokai"
    hi SignColumn ctermbg=237 cterm=NONE guibg=#3c3d37 gui=NONE
    hi link GitGutterAdd LineNr
    hi link GitGutterChange LineNr
    hi link GitGutterDelete LineNr
    hi link GitGutterChangeDelete LineNr
endif
map <PageUp> <Nop>
map <PageDown> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
