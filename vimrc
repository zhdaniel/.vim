set runtimepath+=~/.vim

try
    source ~/.vim/basic.vim
    source ~/.vim/plugins.vim

    source ~/.vim/header.vim
    source ~/.vim/local.vim
catch /./
    echo 'Caught exception: '.v:exception
endtry

