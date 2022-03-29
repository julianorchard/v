" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
" File:       _gvimrc                                               "
" Author:     Julian Orchard <hello@julianorchard.co.uk>            "
" Tag Added:  2022-03-24                                            "
" Desciption: My _gvimrc file for windows (opened a lot, with my    "
"             fork of vim-anywhere).                                "
" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"

" Menu Removal
  se guioptions-=m
  se guioptions-=T
  se guioptions-=r
  se guioptions-=L
  se guioptions-=tT
  se guitabtooltip=%{InfoGuiTooltip()}
  se balloonexpr=FoldSpellBalloon()
" Font 
  set guifont=Consolas:h12:cANSI
" Textwidth
  se textwidth=50
" Spelling
  setl spell spelllang=en_gb
" Goyo
  augroup GGOYO
    autocmd!
    autocmd VimEnter * :Goyo 55
  augroup END
" Remap (and to Auto-Save)
  nnoremap :q :wqa
