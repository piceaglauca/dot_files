set number " display line numbers
set hlsearch " highlight search results
set ts=4 " tab stop
set sw=4 " shift width
set smartindent
set expandtab

syntax enable
filetype plugin on

"autocmd BufReadPost * :silent !update_konsole_tab set 'vim: %:t'
"autocmd VimLeavePre * :silent !update_konsole_tab clean

set tags=~/mytags
