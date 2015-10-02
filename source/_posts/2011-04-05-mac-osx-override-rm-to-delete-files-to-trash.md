---
title: 'Mac OSX: override rm to delete files to .Trash'
author: Noppanit Charassinvichai
layout: post
permalink: /mac-osx-override-rm-to-delete-files-to-trash/
dsq_thread_id:
  - 271869184
categories:
  - Mac OSX
---
So silly of me I have just &#8220;accidentally&#8221; deleted my home directory T_T. There is a way to help that by override rm command to move file to .Trash. 

Just copy this code to ~/.bash_profile and restart your terminal.

```
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}
```
