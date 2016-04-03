augroup filetypedetect
  au BufRead,BufNewFile *.md set filetype=markdown

  " ruby syntax
  au BufNewFile,BufRead Gemfile set filetype=ruby
  au BufNewFile,BufRead Guardfile set filetype=ruby
  au BufNewFile,BufRead config.ru set filetype=ruby
  au BufNewFile,BufRead *.jbuilder set filetype=ruby
  au BufNewFile,BufRead *.schema set filetype=ruby
  au BufNewFile,BufRead *.feature set filetype=ruby
  au BufNewFile,BufRead *.arb set filetype=ruby

  " psgi perl syntax
  au BufNewFile,BufRead *.psgi set filetype=perl
  au BufNewFile,BufRead *.perl set filetype=perl

  " yml yaml syntax
  au BufNewFile,BufRead *.yml set filetype=yaml

  " js syntax
  au BufNewFile,BufRead *.js set filetype=javascript

  " php
  au BufNewFile,BufRead *.php set filetype=php
augroup END
