" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! VIMRC !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
"         File:       vimrc                                                    "
"         Author:     julianorchard <hello@julianorchard.co.uk>                "
"         Tag Added:  2022-03-14                                               "
"         Desciption: My vimrc file, stored in ~/.vim/vimrc, always.           "
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "

    se all&
    se viminfo+=n~/.vim/viminfo

"                  AUTO-COPY VIMRC TO WIN LOCATION, IF CYGWIN                  "
" ~~~~~~~~~~~~~~~~~~~ AND IF IT'S A VIM FILE BEING EDITED ~~~~~~~~~~~~~~~~~~~~ "
    if expand('%:p:h') =~ '.vim' && has('win32unix')
      silent !cp ~/.vim/vimrc ~/vimfiles/vimrc
      silent !cp ~/.vim/gvimrc ~/vimfiles/gvimrc
    en

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PLUG LOAD  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    if empty(glob('~/.vim/autoload/plug.vim'))
      if has('win32unix') || has('unix')
        silent !curl -fLo ~\.vim\autoload\plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        aug PLUG
          au!
          au VimEnter * PlugInstall --sync | so $MYVIMRC
        aug END
      el
        " Use ps1 Script to Install
        echom "Please install Plugins with Cygwin, or script."
      en
    en

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PLUGIN LIST ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    call plug#begin('~/.vim/plugged')
      Plug 'tpope/vim-sensible'
    " Appearance
      Plug 'blueyed/vim-diminactive'
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
      Plug 'pprovost/vim-ps1'
      " Plug 'alvan/vim-closteag'
      " Plug 'mattn/vim-lsp-settings'
      " Plug 'pangloss/vim-javascript'
      " Plug 'prabirshrestha/asyncomplete-lsp.vim'
      " Plug 'prabirshrestha/asyncomplete.vim'
      " Plug 'prabirshrestha/vim-lsp'
    " Under Development
      try
        so ~/desc.vim/plugin/desc.vim
      cat
        Plug 'julianorchard/desc.vim'
      endt
    call plug#end()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~ PLUGIN CONFIGURATIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  " Desc
    let g:desc_author = [["desc", "Julian Orchard <hello@julianorchard.co.uk>"],
                        \["wesc", "Wessex Lifts <marketing@wessexlifts.co.uk>"]]
  " Diminactive
    let g:diminactive_use_colorcolumn = 0

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
      \exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | en
    aug END
    let g:NERDTreeDirArrowExpandable = ' |'
    let g:NERDTreeDirArrowCollapsible = '  ↘'
    let NERDTreeShowHidden=1
    nn <C-t> :NERDTreeToggle<CR>
  "Vim Gist
    " ~/.vim-gist file wasn't working, source a file with:
    "   let g:gist_token = 'TOKEN'
    try
      so ~/.vim/gist.vim
    cat
      echom "ERROR SOURCING ~/.vim/gist.vim: Vim Gist needs token in ~/.vim/gist.vim"
    endt
  "asyncomplete.vim
    " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GENERAL SETTINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  syntax on
  se popt=paper:A4           " print options
  set noeb vb t_vb=          " no error bells
  se enc=utf8                " file encoding
  se history=1000            " command (:) hist
  se mouse=                  " mouse (default)
  se nosm                    " matching bracket on insert
  se nosol                   " jump to rough current cursor position
"  se noswapfile              " yep
  se shm=a                   " avoid all 'hit enter to continue'
  se title                   " title bar title (content below)
  se titlestring=vim:\ %-25.55F\ %a%r%m titlelen=70
  se tf                      " better xterm mainly experience
  se backspace=indent,eol,start

" ~~~~~~~~~~~~~~~~~~~~~~~~~~ REMOVE TRAILING SPACES ~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  aug RTS
    au!
    au BufWritePre * :%s/\s\+$//e
  aug END

" ~~~~~~~~~~~~~~~~~~~~~~~~~ PERSISTENT FILE HISTORY ~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    se undodir=~/.vim/backups
    se undofile
  en

" ~~~~~~~~~~~~~~~~~~~~~~~~~ WRAPPING AND LINE BREAKS ~~~~~~~~~~~~~~~~~~~~~~~~~ "
  se fo+=q fo+=t
  if has("autocmd")
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  en
  se nolist
  se scrolloff=13
  se textwidth=80

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SHIFTING ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  se autoindent
  se shiftround
  se smartindent
  if has("autocmd")
    filetype plugin indent on
  en
  se cpoptions  +=I

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NUMBER STUFF ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  se number
  se relativenumber

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SEARCH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  se hlsearch
  se ic
  se incsearch
  se showmatch

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VISUAL MODE  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  " vn <c-v> <c-q>" Tab
  se ts=2 shiftwidth=2 et
  vn <tab> >vgv
  vn <s-tab> <vgv
  nn j gj
  nn k gk
  vn j gj
  vn k gk

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SPLIT NAVIGATION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  nn <c-j> <C-W><C-J>
  nn <c-k> <C-W><C-K>
  nn <c-l> <C-W><C-L>
  nn <c-h> <C-W><C-H>

" ~~~~~~~~~~~~~~~~~~~ COMM, CENTER COMMENTS IN NORMAL MODE ~~~~~~~~~~~~~~~~~~~ "
" Work in progress;
"   - fix issues with current comment substitution
  fun! s:CenterComment(...)
    " Comment Strings
      let [l,r] = split(get(b:, 'commentary_format',
        \substitute(&commentstring, '^$', '%s', '')), '%s', 1)
      if r == ""
        let r = l
      en
    " Chars and Text
      try
        let l:line_char = a:1
      cat
        let l:line_char = " "
      endt
      let l:line_text = " " . toupper(substitute(substitute(getline('.')
            \, ".*" . l, "", ""), r, "", "")) . " "
      let l:line_len = ((80 - strlen(l:line_text)) / 2) - 2
      if l:line_len < 6
        echom "This line is too long to add a title to."
      el
      " Make oddly numbered lines even
        let l:fill_char = ""
        if strlen(l:line_text) % 2 == 1
          let l:fill_char = l:line_char
        en
      " Create the Line Parts
        let l:i = 1
        wh l:i < l:line_len
          let l:i += 1
          let l:line_char = l:line_char . l:line_char[0]
        endw
      " Insert the Line and Text
        call setline(line("."), substitute(getline('.'),
              \ getline('.'), l . " ". l:line_char . l:line_text .
              \ l:line_char . l:fill_char . " " . r, "g"))
      en
  endfun
  " Function only accepts single chars
    nn comm  :call <SID>CenterComment(" ")<cr>
    nn comm- :call <SID>CenterComment("-")<cr>
    nn comm~ :call <SID>CenterComment("~")<cr>
    nn comm@ :call <SID>CenterComment("@")<cr>
    nn comm! :call <SID>CenterComment("!")<cr>
    nn comm* :call <SID>CenterComment("*")<cr>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ABBREVIATIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  iab @@ hello@julianorchard.co.uk
  iab rubyenv #!/c/MAMP/bin/ruby/bin/ruby.exe
  iab pythonenv #!/c/MAMP/bin/python/bin/python.exe
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
