" File: plug.vim
" Author: Pedro Avalos
" Description: (neo)vim Plug configuration
" Last Modified: 2022-11-14

" Check if vim-plug is installed
if has('nvim')
      if empty(glob('~/.config/nvim/autoload/plug.vim'))
            silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source $MYVIMRC
      endif
else
      if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source $MYVIMRC
      endif
endif

" Install missing plugins
autocmd VimEnter *
                  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                  \| PlugInstall --sync | q
                  \| endif

" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree' |
                  \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
if has('nvim') || has('patch-8.0.902')
      Plug 'mhinz/vim-signify'
else
      Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

call plug#end()
