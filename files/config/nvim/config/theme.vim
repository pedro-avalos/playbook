" File: theme.vim
" Author: Pedro Avalos
" Description: (neo)vim theme configuration
" Last Modified: 2022-11-14

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
endif

colorscheme nord

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
