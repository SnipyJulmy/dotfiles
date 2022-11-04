function! pangolin#yank() abort
  let filename = expand('%')
  let line_number = line('.')
  let line_contents = getline('.')
  echo printf("[%s]\n%s: %s", filename,line_number, line_contents)
endfunction
