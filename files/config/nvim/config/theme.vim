" File: theme.vim
" Author: Pedro Avalos
" Description: (neo)vim theme configuration

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
endif

" {{{ onedark settings
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
" }}}

let g:thematic#defaults = {
      \ 'background': 'dark'
      \ }

let g:thematic#themes = {
      \ 'onedark': {
      \ 'colorscheme': 'onedark',
      \ 'airline-theme': 'onedark',
      \ },
      \ 'nord': {
      \ 'colorscheme': 'nord',
      \ 'airline-theme': 'nord',
      \ },
      \ 'dracula': {
      \ 'colorscheme': 'dracula',
      \ 'airline-theme': 'dracula',
      \ },
      \ }

let g:thematic#theme_name = 'onedark'

nnoremap <Leader>T :ThematicNext<CR>
nnoremap <Leader>D :Thematic pencil_dark<CR>
nnoremap <Leader>L :Thematic pencil_lite<CR>

set laststatus=2

# vim: fdm=marker
