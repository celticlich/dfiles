if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader = ","
call plug#begin()
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-plug'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'whatyouhide/vim-gotham'
Plug 'jiangmiao/auto-pairs'
Plug 'arcticicestudio/nord-vim'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

nnoremap <C-S-tab> 	:tabprevious<CR>
nnoremap <C-tab> 	:tabnext<CR>
nnoremap <C-t>		:tabnew<CR>
inoremap <C-S-tab>	<Esc>:tabprevious<CR>i
inoremap <C-tab>	<Esc>:tabnext<CR>i
inoremap <C-t>		<Esc>:tabnew<CR>i

nnoremap <C-S-f>	:FZF<CR>

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "left"
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
let &t_SI .= "\<Esc>[?2004h"
 let &t_EI .= "\<Esc>[?2004l"

 inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

 function! XTermPasteBegin()
       set pastetoggle=<Esc>[201~
         set paste
           return ""
       endfunction]]
 "]"
 "]"

set number
filetype indent on
set showmatch
set tabstop=4
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
" let g:airline_theme='gotham256'
