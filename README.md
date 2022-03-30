# Vim Config

## Installation

`git clone https://github.com/julianorchard/vim
.vim`
`cd .vim`
`./win-sync.sh`/`.\win-sync.ps1`

## Highlights

**iabbrev Insert Signature Automatically from Git
User.Name and User.Email Variables**

```vim
  iab <expr> ~g substitute(system('git config --global user.name') . " <" .
     \system('git config --global user.email') . ">", '\n', '', 'g')
```

**Centre Align Text, Function**

```vim
  fun! s:CenterComment(...)
    " Comment Strings
      let [l,r] = split(get(b:, 'commentary_format',
      \ substitute(&commentstring, '^$', '%s', '')), '%s', 1)
      if r == ""
        let r = l
      en
    " Chars and Text
      try
        let l:line_char = a:1
      cat
        let l:line_char = "-"
      endt
      let l:line_text = " " . toupper(substitute(substitute(getline('.')
            \, ".*" . l "^\s*", "", ""), r, "", "")) . " "
      let l:line_len = ((80 - strlen(l:line_text)) / 2) - 2
    " Make oddly numbered lines even
      let l:fill_char = ""
      if strlen(l:line_text) % 2 == 1
        let l:fill_char = l:line_char[0]
      en
    " Create the Line Parts
      let l:i = 1
      wh l:i < l:line_len
        let l:i += 1
        let l:line_char = l:line_char . l:line_char[0]
      endw
    call setline(line("."), substitute(getline('.'),
          \ getline('.'), l . " ". l:line_char . l:line_text .
          \ l:line_char . l:fill_char . " " . r, "g"))
  endfun
  " Function only accepts single chars
    nn comm- :call <SID>CenterComment("-")<cr>
    nn comm~ :call <SID>CenterComment("~")<cr>
    nn comm@ :call <SID>CenterComment("@")<cr>
    nn comm! :call <SID>CenterComment("!")<cr>
    nn comm* :call <SID>CenterComment("*")<cr>
```
