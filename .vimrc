set number
set showmatch
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set fileencodings=utf8,cp932,euc-jp
set laststatus=2
set nocompatible
set backspace=2
set cursorline
highlight cursorline term=reverse cterm=reverse
syntax on

filetype off

set rtp+=~/dotfiles/neobundle.vim

if has('vim_starting')
    set runtimepath+=~/dotfiles/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', { 'build' : {
    \           'mac' : 'make -f make_mac.mak',
    \           'unix' : 'make -f make_unix.mak',
    \       },
    \   }
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'

filetype plugin on
filetype indent on

colorscheme molokai

" ----------------------------------
" For neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Close Popup Window
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Select popup
inoremap <expr><C-y> neocomplcache#close_popup()
let g:neocomplcache_ctags_arguments_list = {
    \ 'perl' : '-R -h ".pm"'
\ }
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
\ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" ----------------------------------
" For neosnippet
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)


" ----------------------------------
" For vim-quickrun
nmap <Leader>r <plug>(quickrun)


" ----------------------------------
" For vim-indent-guides
" vim立ち上げ時に自動的にvim-indent-guidesをオンにする。
let g:indent_guides_enable_on_vim_startup = 1
" autoで色付けするのはストップ
let g:indent_guides_auto_colors = 0
" 色の変化幅（？）パーセンテージ
let g:indent_guides_color_change_percent = 30
" 奇数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=red
" 偶数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=yellow
" インデントの色付け幅
let g:indent_guides_guide_size = 1


" For vim-fugitive
set statusline=%f\ [%{&fenc==''?&enc:&fenc}][%{&ff}]%{fugitive#statusline()}%=%8l:%c%8P
