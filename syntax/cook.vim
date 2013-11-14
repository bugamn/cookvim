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
syn match   cookSpecial       "\\\(\d\{1,3}\|.\)"
syn region  cookString        start=+"+ end=+"+ skip=+\\"+ contains=cookSpecial,cookPattern oneline
syn region  cookString        start=+'+ end=+'+ skip=+\\'+ contains=cookSpecial,cookPattern oneline

syn match   cookVariable    "^\s*\w\+\s*="

syn region cookComment  start="/\*" end="\*/" keepend contains=cookTodo
syn keyword cookTodo    contained TODO FIXME XXX Note

syn keyword cookConditional if else then

syn keyword cookRepeat      loop

syn keyword cookPreDefVars  __FILE__ __LINE__ __FUNCTION__
syn keyword cookPreDefVars  arg command-line-goals graph_leaf_file
syn keyword cookPreDefVars  graph_exterior_file graph_interior_file
syn keyword cookPreDefVars  graph_leaf_pattern graph_exterior_pattern
syn keyword cookPreDefVars  graph_interior_file need parallel_hosts
syn keyword cookPreDefVars  parallel_jobs parallel_rsh search_list
syn keyword cookPreDefVars  self target targets thread-id younger
syn keyword cookPreDefVars  version
syn match   cookPreDefVars  "@\d"

" Builtin functions
syn keyword cookFunction    contained addprefix addsuffix and basename cando
syn keyword cookFunction    contained catenate collect_lines collect cook count
syn keyword cookFunction    contained dirname dir dos-path downcase
syn keyword cookFunction    contained entryname execute exists exists-symlink
syn keyword cookFunction    contained expr filter_out filter find_command
syn keyword cookFunction    contained findstring firstword fromto getenv glob
syn keyword cookFunction    contained head home in interior_files join leaf_files
syn keyword cookFunction    contained matches match_mask mtime mtime-seconds
syn keyword cookFunction    contained notdir not operating_system options
syn keyword cookFunction    contained pathname patsubst prepost print quote
syn keyword cookFunction    contained read_lines readlink read relative_dirname
syn keyword cookFunction    contained resolve shell sort_newest sort split stringset
syn keyword cookFunction    contained stripdot strip substr subst suffix tail
syn keyword cookFunction    contained un-dos-path unsplit upcase uptodate wildcard
syn keyword cookFunction    contained word words write

syn match   cookPattern "%\d\?"

syn match   cookRecipe  "^.*\S.*:" contains=cookPattern

syn keyword cookOption  clearstat mkdir unlink fingerprint
syn keyword cookOption  noclearstat nomkdir nounlink nofingerprint
syn keyword cookOption  time-adjust cascade
syn keyword cookOption  notime-adjust nocascade

syn cluster cookFCGroup contains=cookFunCall,cookstatement,cookString,cookPreDefVars,cookComment,cookFunction,cookPattern
syn region  cookFunCall matchgroup=Delimiter start="\[" end="]" contains=@cookFCGroup

syn keyword cookHosts       host-binding single-thread
syn keyword cookStatement   fail set unsetenv return function loopstop
syn match   cookPreProc     "#" nextgroup=cookPreProcArg
syn keyword cookPreProcArg  contained include include-cooked include-cooked-nowarn
syn keyword cookPreProcArg  contained if elif else endif ifdef ifndef pragma pragma
syn region  cookCStatement  start="{" end="}" fold transparent
hi link cookPreProcArg cookPreProc
hi link cookCharacters cookStatement
hi link cookHosts cookStatement

hi def link cookConditional     Conditional
hi def link cookRepeat          Repeat
hi def link cookSpecial         SpecialKey
hi def link cookPreProc         PreProc
hi def link cookComment         Comment
hi def link cookString          String
hi def link cookStatement       Statement
hi def link cookFunction        Function
hi def link cookRecipe          Function
hi def link cookTodo            Todo
hi def link cookPattern         Type
hi def link cookPreDefVars      Constant
hi def link cookOption          Structure
hi def link cookVariable        Identifier

let b:current_syntax = "cook"

