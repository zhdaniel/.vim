colorscheme desert

if exists("$_GBK_") && !exists("$TMUX")
    set termencoding=cp936
else
    set termencoding=utf-8
endif

set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,latin1
set nowrap

if executable("clang++")
    let g:syntastic_c_compiler   = 'clang'
    let g:syntastic_cpp_compiler = 'clang++'
elseif executable("g++")
    let g:syntastic_c_compiler   = 'gcc'
    let g:syntastic_cpp_compiler = 'g++'
endif

let g:syntastic_c_compiler_options   = '-std=c99'
let g:syntastic_cpp_compiler_options = '-std=c++11'

let s:locals = [ "libevent", "boost", "protoc", "mysql", "php" ]
for i in s:locals
    if i =~ '^[\~\/]'
        let dir = expand(i)
    else
        let dir = join([ g:HOME, 'local', i, 'include' ], '/')
    endif
    if empty(glob(dir)) | continue | endif

    if !exists("g:syntastic_c_include_dirs")
        let g:syntastic_c_include_dirs = []
    endif
    if !exists("g:syntastic_cpp_include_dirs")
        let g:syntastic_cpp_include_dirs = []
    endif

    let g:syntastic_c_include_dirs = add(g:syntastic_c_include_dirs, dir)
    let g:syntastic_cpp_include_dirs = add(g:syntastic_cpp_include_dirs, dir)
endfor

