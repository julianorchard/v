" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! GVIMRC !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "
" -------------------------------------,,------------------------------------- "
"       File:       gvimrc                                                     "
"       Author:     Julian Orchard <hello@julianorchard.co.uk>                 "
"       Tag Added:  2022-03-24                                                 "
"       Desciption: My gvimrc file for windows (opened a lot, with my          "
"                   fork of vim-anywhere).                                     "
" -------------------------------------''------------------------------------- "

" ----------------------------------- BELL ----------------------------------- "
  set vb t_vb=

" ------------------------------- MENU REMOVAL ------------------------------- "
  se guioptions-=m
  se guioptions-=T
  se guioptions-=r
  se guioptions-=L
  se guioptions-=tT
  se guitabtooltip=%{InfoGuiTooltip()}
  se balloonexpr=FoldSpellBalloon()

" ---------------------------------- LEADER ---------------------------------- "
  let mapleader = ","
  
" ----------------------------------  FONT  ---------------------------------- "
  if has('win32') || has('win32unix')
    set guifont=Consolas:h12:cANSI
  el
    set guifont=Monospace:h12
  en

" -------------------------------- TEXTWIDTH --------------------------------- "
  se textwidth=50

" --------------------------------- SPELLING --------------------------------- "
  setl spell spelllang=en_gb

" ----------------------------------- GOYO ----------------------------------- "
  augroup GGOYO
    autocmd!
    autocmd VimEnter * :Goyo 55
  augroup END

" --------- CTRL + BACKSPACE TO DELETE PREVIOUS WORD IN INSERT MODE ---------- "
  im <C-BS> <C-w>

" ------------------------- REMAP (AND TO AUTO-SAVE) ------------------------- "
  if expand('%:p:h') =~ 'vim-anywhere'
    se fo+=a
    nn <Leader>q :wqa<cr>
  en
