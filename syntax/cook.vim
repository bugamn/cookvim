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
syn match cookString        "\(\".\"\|'.'\)"

syn region cookComment  start="/*" end="*/" keepend

" some special characters
syn match cookCharacters    "[][{}:=;]"
syn keyword cookConditional if else then
syn keyword cookLoop        loop loopstop
syn keyword cookHosts       host-binding single-thread
syn keyword cookStatement   fail function set unsetenv return
hi link cookConditional cookStatement
hi link cookLoop cookStatement
hi link cookHosts cookStatement
hi link cookCharacters cookSpecial

if version >= 508 || !exists("did_make_syn_inits")
  if version < 508
    let did_make_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cookComment        Comment
  HiLink cookString         String
  HiLink cookStatement      Statement
  delcommand HiLink
endif

let b:current_syntax = "cook"
