" Vim syntax file
" Language:  Cook
" Maintainer: Daniel Alves <daniel.fsalves@gmail.com>
" URL:
" Last Changes:   2013 Nov 12

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" special quoting
syn match cookSpecial       "\\\(\d\{1,3}\|.\)"
syn match cookString        "\(\".*\"\|'.*'\)"

syn region cookComment  start="/\*" end="\*/" keepend

" some special characters
syn match  cookCharacters   "\([][{}:=;]\|+=\)"
syn keyword cookConditional if else then
syn keyword cookLoop        loop loopstop
syn keyword cookHosts       host-binding single-thread
syn keyword cookFunction    function
syn keyword cookStatement   fail set unsetenv return
syn match   cookPreProc     "#" nextgroup=cookPreProcArg
syn keyword cookPreProcArg  contained include include-cooked include-cooked-nowarn
syn keyword cookPreProcArg  contained if elif else endif ifdef ifndef pragma pragma
syn region  cookCStatement  start="{" end="}" fold transparent
hi link cookPreProcArg cookPreProc
hi link cookConditional cookStatement
hi link cookCharacters cookStatement
hi link cookLoop cookStatement
hi link cookHosts cookStatement

let b:current_syntax = "cook"

hi def link cookSpecial         SpecialKey
hi def link cookPreProc         PreProc
hi def link cookComment         Comment
hi def link cookString          String
hi def link cookStatement       Statement
hi def link cookFunction        Function

