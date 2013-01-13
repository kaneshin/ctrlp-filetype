if exists('g:loaded_ctrlp_filetype') && g:loaded_ctrlp_filetype
  finish
endif
let g:loaded_ctrlp_filetype = 1

let s:filetype_var = {
\  'init':   'ctrlp#filetype#init()',
\  'accept': 'ctrlp#filetype#accept',
\  'lname':  'filetype',
\  'sname':  'ft',
\  'type':   'line',
\  'enter':  'ctrlp#filetype#enter()',
\  'exit':   'ctrlp#filetype#exit()',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:filetype_var)
else
  let g:ctrlp_ext_vars = [s:filetype_var]
endif

function! ctrlp#filetype#init()
  let ftdir = expand('$VIMRUNTIME/syntax')
  let candidate = g:ctrlp_filetype.user
  let candidate += map(split(globpath(ftdir,'*.vim'), "\n"), 'fnamemodify(v:val,":t:r")')
  return candidate
endfunc

function! ctrlp#filetype#accept(mode, str)
  call ctrlp#exit()
  let &ft=a:str
endfunction

function! ctrlp#filetype#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#filetype#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
