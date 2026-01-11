set number
set relativenumber

augroup LineNumbers
  autocmd!
  autocmd BufEnter,WinEnter * setlocal number relativenumber
augroup END

" ===== vim-plug =====
if has('nvim')
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin(g:plug_home)

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

call plug#end()

