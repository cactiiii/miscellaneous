"重要，能避免一些奇怪现象
set nocompatible

"自动恢复光标
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"tab相关
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start

"色彩相关
colorscheme ron
syntax on
set hlsearch

"编码相关
set encoding=utf8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set nu
set ignorecase
set noerrorbells
set novisualbell
set background=dark
