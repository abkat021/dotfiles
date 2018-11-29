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
	Plug 'ap/vim-buftabline'                        " Show buffers in the tab bar.

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

" Leader key -- default shortcut key
let mapleader = "\<Space>"                          " Set <Leader> (default shortcut used in mappings below) to Spacebar.


" BuffTabLine stuff
nmap <leader>1 <Plug>BufTabLine.Go(1)|         " <leader>1 goes to buffer 1 (see numbers in tab bar).
nmap <leader>2 <Plug>BufTabLine.Go(2)|         " <leader>1 goes to buffer 2 (see numbers in tab bar).
nmap <leader>3 <Plug>BufTabLine.Go(3)|         " <leader>1 goes to buffer 3 (see numbers in tab bar).
nmap <leader>4 <Plug>BufTabLine.Go(4)|         " <leader>1 goes to buffer 4 (see numbers in tab bar).
nmap <leader>5 <Plug>BufTabLine.Go(5)|         " <leader>1 goes to buffer 5 (see numbers in tab bar).
nmap <leader>6 <Plug>BufTabLine.Go(6)|         " <leader>1 goes to buffer 6 (see numbers in tab bar).
nmap <leader>7 <Plug>BufTabLine.Go(7)|         " <leader>1 goes to buffer 7 (see numbers in tab bar).
nmap <leader>8 <Plug>BufTabLine.Go(8)|         " <leader>1 goes to buffer 8 (see numbers in tab bar).
nmap <leader>9 <Plug>BufTabLine.Go(1) :bp<CR>| " <leader>1 goes to last buffer (see numbers in tab bar).

let g:buftabline_numbers = 2                        " Show buftabline's count (use <Leader>1-9 to switch.
let g:buftabline_indicators = 1                     " Show a + if the buffer has been modified.

nnoremap          <Tab> :bn<CR>|                    " Tab to switch to next buffer,
nnoremap          <S-Tab> :bp<CR>|                  "  ↳ Shift-Tab to switch to previous buffer.
" Gib's plugins:
" https://github.com/gibfahn/dot/blob/master/dotfiles/.config/nvim/init.vim
"
