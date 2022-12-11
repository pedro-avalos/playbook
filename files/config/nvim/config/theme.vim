" File: theme.vim
" Author: Pedro Avalos
" Description: (neo)vim theme configuration

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
endif

let g:thematic#themes = {
      \ 'onedark': { 'colorscheme': 'onedark',
      \              ''
      \ }
      \ }

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
colorscheme onedark

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
