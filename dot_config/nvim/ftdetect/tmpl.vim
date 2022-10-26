augroup TemplateDetect
  au!
  au BufReadPost *.zshrc.tmpl,*.zshrc set filetype=zsh
  au BufReadPost *.tmux.conf.tmpl set filetype=tmux
augroup END
