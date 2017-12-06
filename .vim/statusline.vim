function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
 let l:branchname = GitBranch()
 let l:git = '+'.GitGutterGetHunkSummary()[0].' ~'.GitGutterGetHunkSummary()[1].' -'.GitGutterGetHunkSummary()[2].' '.l:branchname
  return strlen(l:branchname) > 0?'  '.l:git.' ':''
endfunction

let g:currentmode={
  \ 'n' : 'NORMAL ',
  \ 'v' : 'VISUAL-CHAR ',
  \ 'V' : 'VISUAL-LINE ',
  \ '^V' : 'VISUAL-BLOCK ',
  \ 's' : 'SELECT ',
  \ 'S' : 'SELECT-LINE ',
  \ '^S' : 'SELECT-BLOCK ',
  \ 'i' : 'INSERT ',
  \ 'R' : 'REPLACE ',
  \ 'Rv' : 'VIRTUAL-REPLACE ',
  \ 'c'  : 'COMMAND ',
  \ 'cv' : 'VIM EX ',
  \ 'ce' : 'NORMAL EX ',
  \ 'r'  : 'PROMPT ',
  \ 'rm' : 'MORE PROMPT ',
  \ 'r?' : 'CONFIRM ',
  \ '!'  : 'SHELL ',
  \ 't'  : 'TERMINAL '
  \}

function ChangeModeColor(mode)
  if (a:mode == 'n')
    exe 'hi ModeColor ctermbg=70 ctermfg=7'
  elseif (a:mode == 'i')
    exe 'hi ModeColor ctermbg=26 ctermfg=7'
  elseif (a:mode ==# 'R')
    exe 'hi ModeColor ctermbg=161 ctermfg=7'
  elseif (a:mode == 'v' || a:mode == 'V')
    exe 'hi ModeColor ctermbg=172 ctermfg=7'
  endif
  return ''
endfunction

hi ModeColor ctermbg=70 ctermfg=7
hi GitColor ctermbg=59 ctermfg=7

set laststatus=2
set statusline=
"set statusline+=%{ChangeModeColor(mode())}
set statusline+=%#ModeColor#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#GitColor#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#PmenuSel#
set statusline+=\ %l:%c
set statusline+=\ %L
