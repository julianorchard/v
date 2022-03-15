" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
" File:       vimrc                                                 "
" Author:     julianorchard <hello@julianorchard.co.uk>             "
" Tag Added:  2022-03-14                                            "
" Desciption: My vimrc file, stored in ~/.vim/vimrc, always.        "
" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"

  se viminfo+=n~/.vim/viminfo

" PLUG STUFF
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
    " Appearance 
      Plug 'flazz/vim-colorschemes'
      Plug 'junegunn/goyo.vim'
      Plug 'junegunn/limelight.vim'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
    " Org-Like
      Plug 'itchyny/calendar.vim'
      Plug 'dhruvasagar/vim-dotoo'
      Plug 'mattn/vim-gist'
      Plug 'mattn/webapi-vim'
    " Text Manipulation
      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-surround'
      Plug 'dhruvasagar/vim-table-mode'
      Plug 'mg979/vim-visual-multi'
    " NerdTree
      Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
      Plug 'ryanoasis/vim-devicons'
    " Language
      Plug 'dense-analysis/ale'
      " Plug 'alvan/vim-closteag'
      " Plug 'mattn/vim-lsp-settings'
      " Plug 'pangloss/vim-javascript'
      " Plug 'prabirshrestha/asyncomplete-lsp.vim'
      " Plug 'prabirshrestha/asyncomplete.vim'
      " Plug 'prabirshrestha/vim-lsp'
    " Under Development
      try 
        source ~/desc.vim/plugin/desc.vim
      catch
        Plug 'julianorchard/desc.vim'
      endtry
    call plug#end()

" PLUG SETTINGS
  " Desc
    let g:desc_author = [["desc", "Julian Orchard <hello@julianorchard.co.uk>"], 
                        \["wesc", "Wessex Lifts <marketing@wessexlifts.co.uk>"]]
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
  "Vim Gist
    " ~/.vim-gist file wasn't working, source a file with:
    "   let g:gist_token = 'TOKEN'
    try
      source ~/.vim/gist.vim
    catch
      echom "ERROR SOURCING ~/.vim/gist.vim: Vim Gist needs token in ~/.vim/gist.vim"
    endtry
	"asyncomplete.vim
    " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
	

" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
" General
	syntax on 
	se belloff=all
	se encoding=utf-8
	se fileencoding=utf-8
	se fileencodings=utf-8
	se history=1000
	se laststatus=2
	se lazyredraw
	se mouse=
	se noshowmatch
	se nostartofline
	se noswapfile
	se shortmess=atI
	se title
	se ttyfast
	se ttymouse=
	se wildmenu

" Auto Comment Insertion, Off
	aug AUTOCOMMENTOFF
		au!
		au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
	aug END

" Wrapping and Line Breaks
	se formatoptions-=t
	se formatoptions-=t0
	se linebreak
	se nolist  
	se scrolloff=13
	se textwidth=80
	se wrap

" Shifting
	se autoindent
	se shiftround
	se smartindent 
  if has("autocmd")
    filetype plugin indent on
  endif 
	se cpoptions  +=I

" Number Stuff
	se number 
	se relativenumber

" Search
	se hlsearch
	se ic
	se incsearch
	se showmatch

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
  iab <expr> ~g substitute(system('git config --global user.name') . " <" . 
     \system('git config --global user.email') . ">", '\n', '', 'g') 
  iab lipsum 
        \ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
        \ eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        \ veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        \ commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        \ esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        \ non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
