set runtimepath+=~/.vim

source ~/.vim/basic.vim
source ~/.vim/plugins.vim

try
    source ~/.vim/local.vim
catch
endtry

