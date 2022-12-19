" File: init.vim
" Author: Pedro Avalos
" Description: (neo)vim main configuration

if has('nvim')
  source $HOME/.config/nvim/config/general.vim
  source $HOME/.config/nvim/config/plug.vim
  source $HOME/.config/nvim/config/nerdcommenter.vim
  source $HOME/.config/nvim/config/nerdtree.vim
  source $HOME/.config/nvim/config/coc.vim
  source $HOME/.config/nvim/config/theme.vim
else
  source $HOME/.vim/config/general.vim
  source $HOME/.vim/config/plug.vim
  source $HOME/.vim/config/nerdcommenter.vim
  source $HOME/.vim/config/nerdtree.vim
  source $HOME/.vim/config/coc.vim
  source $HOME/.vim/config/theme.vim
endif
