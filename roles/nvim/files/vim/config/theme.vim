" File: theme.vim
" Author: Pedro Avalos
" Description: (neo)vim theme configuration

if has('termguicolors')
  set termguicolors
endif

let g:airline_powerline_fonts=1

let g:thematic#defaults = {
      \ 'background': 'dark',
      \ 'laststatus': 2,
      \ }

let g:thematic#themes = {
      \ 'edge_dark': {
      \ 'colorscheme': 'edge',
      \ 'airline-theme': 'edge',
      \ },
      \ 'edge_light': {
      \ 'colorscheme': 'edge',
      \ 'airline-theme': 'edge',
      \ 'background': 'light',
      \ },
      \ 'everforest_dark': {
      \ 'colorscheme': 'everforest',
      \ 'airline-theme': 'everforest',
      \ },
      \ 'everforest_light': {
      \ 'colorscheme': 'everforest',
      \ 'airline-theme': 'everforest',
      \ 'background': 'light',
      \ },
      \ 'gruvbox_material_dark': {
      \ 'colorscheme': 'gruvbox-material',
      \ 'airline-theme': 'gruvbox_material',
      \ },
      \ 'gruvbox_material_light': {
      \ 'colorscheme': 'gruvbox-material',
      \ 'airline-theme': 'gruvbox_material',
      \ 'background': 'light',
      \ },
      \ 'nord': {
      \ 'airline-theme': 'nord',
      \ },
      \ 'dracula': {
      \ 'airline-theme': 'dracula',
      \ },
      \ }

let g:thematic#theme_name = 'edge_dark'

nnoremap <Leader>T :ThematicNext<CR>
nnoremap <Leader>D :Thematic edge_dark<CR>
nnoremap <Leader>L :Thematic edge_light<CR>
