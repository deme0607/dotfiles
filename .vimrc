set number
set showmatch
set autoindent
set smartindent
set expandtab
set fileencodings=utf8,cp932,euc-jp
set backspace=start,eol,indent
set hlsearch
set term=screen-256color
set t_Co=256

syntax on

filetype off

set laststatus=2

if has('vim_starting')
    set nocompatible
    filetype off
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

call neobundle#end()
call vundle#end()
filetype plugin indent on

source $HOME/.vim/*.vim

if filereadable($HOME . '/.vimrc.local')
    source $HOME/.vimrc.local
endif

vmap <Enter> <Plug>(EasyAlign)

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

function! ZenkakuSpace()
        highlight ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=darkgrey
endfunction

filetype plugin indent on

if has('gui_macvim')
        " for Mac Vim
else
        " not for Mac Vim
endif

colorscheme hybrid
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode
