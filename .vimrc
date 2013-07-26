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

if filereadable($HOME . '/.vimrc.local')
    source $HOME/.vimrc.local
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
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

" {{{
"if has("lua")
"  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
"        \   'insert' : 1,
"        \ }}
"else
"  NeoBundleLazy 'Shougo/neocomplete', {
"        \ 'autoload' : {
"        \   'insert' : 1,
"        \ },
"        \ }
"endif

NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'alpaca-tc/unite-rails_best_practices', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'build' : {
      \    'mac': 'gem install rails_best_practices',
      \    'unix': 'gem install rails_best_practices',
      \ },
      \ 'autoload': {
      \   'unite_sources': 'rails_best_practices'
      \ }}

NeoBundle 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
      \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['AlpacaTagsUpdate', 'AlpacaTagsSet', 'AlpacaTagsBundle']
      \ }}

" }}}

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
