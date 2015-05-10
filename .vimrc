set number
set showmatch
set autoindent
set smartindent
set expandtab
set fileencodings=utf8,cp932,euc-jp
set nocompatible
set backspace=start,eol,indent
set hlsearch
set cursorline
set t_Co=256
" highlight cursorline term=reverse cterm=reverse
syntax on

filetype off

set laststatus=2

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
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', { 'build' : {
    \           'mac' : 'make -f make_mac.mak',
    \           'unix' : 'make -f make_unix.mak',
    \       },
    \   }
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'elzr/vim-json'
NeoBundle 'sudo.vim'

NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}


" ----------------------------------
au FileType ruby IndentGuidesEnable
au FileType ruby let indent_guides_auto_colors = 0
au FileType ruby autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
au FileType ruby autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=237
au FileType ruby let indent_guides_color_change_percent = 10
au FileType ruby let indent_guides_guide_size = 1

augroup HighlightTrailingSpaces
        autocmd!
        autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
        autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

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

"NeoBundle 'tpope/vim-rails', { 'autoload' : {
"      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
"
"NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
"      \ 'autoload' : {
"      \   'insert' : 1,
"      \ }}
"
"NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
"      \ 'filetypes': 'ruby',
"      \ 'mappings' : ['nx', '%'] }}
"
"NeoBundleLazy 'basyura/unite-rails', {
"      \ 'depends' : 'Shougo/unite.vim',
"      \ 'autoload' : {
"      \   'unite_sources' : [
"      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
"      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
"      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
"      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
"      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
"      \     'rails/stylesheet', 'rails/view'
"      \   ]
"      \ }}
"
"NeoBundleLazy 'alpaca-tc/unite-rails_best_practices', {
"      \ 'depends' : 'Shougo/unite.vim',
"      \ 'build' : {
"      \    'mac': 'gem install rails_best_practices',
"      \    'unix': 'gem install rails_best_practices',
"      \ },
"      \ 'autoload': {
"      \   'unite_sources': 'rails_best_practices'
"      \ }}

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

if has('gui_macvim')
else
colorscheme hybrid
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode
endif

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
let g:neocomplcache_enable_camel_case_completion = 0
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


" For vim-fugitive
set statusline=%f\ [%{&fenc==''?&enc:&fenc}][%{&ff}]%{fugitive#statusline()}%=%8l:%c%8P

" vim-tags
nnoremap <C-]> g<C-]>

" ruby syntax
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead config.ru set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" psgi perl syntax
au BufNewFile,BufRead *.psgi set filetype=perl
au BufNewFile,BufRead *.perl set filetype=perl

" yml yaml syntx
au BufNewFile,BufRead *.yml set filetype=yaml

au BufNewFile,BufRead *.js set filetype=javascript

let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
        autocmd VimEnter * execute 'NERDTree ./'
endif
