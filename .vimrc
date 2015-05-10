set number
set showmatch
set autoindent
set smartindent
set expandtab
set fileencodings=utf8,cp932,euc-jp
set nocompatible
set backspace=start,eol,indent
set hlsearch
" set cursorline
set t_Co=256

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

" yml yaml syntax
au BufNewFile,BufRead *.yml set filetype=yaml

" js syntax
au BufNewFile,BufRead *.js set filetype=javascript

let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
        autocmd VimEnter * execute 'NERDTree ./'
endif
