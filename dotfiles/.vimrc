set nocompatible            " be iMproved, required
filetype plugin indent on   " required
filetype off                " required

" Sets the standard config directories -- let's agree to put stuff in a few
" manageable directories, rather than letting it sprawl like Mexico City
if empty($XDG_CONFIG_HOME)| let $XDG_CONFIG_HOME = $HOME . '/.config'| endif
if empty($XDG_CACHE_HOME)| let $XDG_CACHE_HOME = $HOME . '/.cache'| endif
if empty($XDG_DATA_HOME)| let $XDG_DATA_HOME = $HOME . '/.local/share'| endif


" Put plugs here
call plug#begin('~/.local/share/nvim/plugged')      " Load plugins with vim-plug.
	Plug 'gibfahn/vim-gib'                          " Use vim colorscheme.
call plug#end()									    " Initialize plugin system

command! PU PlugClean | PlugUpdate | PlugUpgrade|   " :PI installs vim-plug, :PU updates/cleans plugins and vim-plug.

command! PI !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
    \ ln -s ~/.local/share/nvim/site/autoload ~/.vim/autoload

" Gibson's color scheme
colo gib                                          " Use my colorscheme

" Literally the biggest lifesaver of all time
set mouse=a                                       " Mouse in all modes (mac: Fn+drag = copy)

" Tabs & Spaces
set shiftwidth=4 tabstop=4 softtabstop=4          " Set tab width to 4.


" Sends backups to ~/.cache/vim/undo -- keeps things clean so that I am not
" generating .swp files in my current directory, but instead in this nice
" hidden .cache file
let s:undodir = $XDG_CACHE_HOME . "/vim/undo"
if !isdirectory(s:undodir)| call mkdir(s:undodir, "p", 0700)| endif
set undofile                                        " Persist undo history on file close.
let &undodir=s:undodir                              " Store undo files in cache dir.

" Some automatic function shit
augroup gibAutoGroup                              " Group of automatic functions.
  autocmd!
  autocmd BufWritePost .vimrc so $MYVIMRC|         "Reload .vimrc on save.

augroup END

" Gib's plugins:
" https://github.com/gibfahn/dot/blob/master/dotfiles/.config/nvim/init.vim
"
