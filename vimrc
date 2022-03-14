" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
" File:       vimrc                                                 "
" Author:     julianorchard <hello@julianorchard.co.uk>             "
" Tag Added:  2022-03-14                                            "
" Desciption: My vimrc file, stored in ~/.vim/vimrc, always.        "
" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"

  se viminfo+=n~/.vim/viminfo

" NOTES, :echo getcompletion('SEARCH', 'filetype')

" Plug Load 
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~\.vim\autoload\plug.vim --create-dirs 
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		aug PLUG
			au!
			au VimEnter * PlugInstall --sync | source $MYVIMRC
		aug END
	endif  

" Plug List
	call plug#begin('~/.vim/plugged')
		Plug 'dense-analysis/ale'
		Plug 'flazz/vim-colorschemes'
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/goyo.vim'
		Plug 'itchyny/calendar.vim'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-repeat'
		Plug 'tpope/vim-fugitive'
		Plug 'tpope/vim-commentary'
	"NERD
		Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
		Plug 'ryanoasis/vim-devicons'
	"Lang
" 	Plug 'prabirshrestha/vim-lsp'
" 	Plug 'mattn/vim-lsp-settings'
" 	Plug 'prabirshrestha/asyncomplete.vim'
" 	Plug 'prabirshrestha/asyncomplete-lsp.vim'
" 	Plug 'pangloss/vim-javascript'
" 	Plug 'alvan/vim-closteag'
	call plug#end()

" Plug setings
  " Desc
    let g:desc_author = [["desc", "Julian Orchard <hello@julianorchard.co.uk>"], 
                        \["wesc", "Wessex Lifts <marketing@wessexlifts.co.uk>"]]
    " TESTING DESC.VIM
    source ~/desc.vim/plugin/desc.vim
	" Colourscheme
		color louver
		let g:airline_theme='silver'
	" Limelight
		aug GOYOLL
			au!
			au User GoyoEnter Limelight
			au User GoyoLeave Limelight!
		aug END
	"Closetag Extensions
		let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
	"Clock Shortcut
		nn <c-c> :Calendar -view=clock<cr>
	"NERDTree
		aug NERD
			au!
			au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && 
            \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
		aug END
		let g:NERDTreeDirArrowExpandable = ' |'
		let g:NERDTreeDirArrowCollapsible = '  ↘'
		let NERDTreeShowHidden=1
		nn <C-t> :NERDTreeToggle<CR>
	"asyncomplete.vim
 "	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
 "	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
 "	inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
	
" General
	syntax on 
	se noswapfile
	se laststatus=2
	se encoding=utf-8
	se fileencoding=utf-8
	se fileencodings=utf-8
	se ttyfast
	se title
	se wildmenu
	se nostartofline
	se shortmess=atI
	se history=1000
	se lazyredraw
	se noshowmatch
	se belloff=all
	se mouse=
	se ttymouse=

" Auto Comment Insertion, Off
	aug AUTOCOMMENTOFF
		au!
		au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
	aug END

" Wrapping and Line Breaks
	se wrap
	se linebreak
	se nolist  
	se scrolloff=13
	se textwidth=80
	se formatoptions-=t0
	se formatoptions-=t

" Shifting
	se shiftround
	se autoindent
	se smartindent 
	se cpoptions  +=I

" Number Stuff
	se number 
	se relativenumber

" Search
	se showmatch
	se hlsearch
	se ic
	se incsearch

" Visual Mode 
	vn <c-v> <c-q>" Tab

" Tab Tab Tab
	se tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	"Useful Visual Tab
	vn <tab> >vgv
	vn <s-tab> <vgv

" Make hjkl Graphical
	nn j gj
	nn k gk
	vn j gj
	vn k gk

" 'd' Deletes, Doesn't Cut
	nn d "_d
	vn d "_d

" Split Nav
	nn <c-j> <C-W><C-J>
	nn <c-k> <C-W><C-K>
	nn <c-l> <C-W><C-L>
	nn <c-h> <C-W><C-H>

" Go
	nn <c-b> :!go run % <cr>

" Abbreviations
  iab @@ hello@julianorchard.co.uk
  iab ~~ Julian Orchard <hello@julianorchard.co.uk>
  iab lipsum 
        \ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
        \ eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        \ veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        \ commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        \ esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        \ non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
