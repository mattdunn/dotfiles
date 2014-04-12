#!/bin/sh

symlink_dotfiles(){
  for name in .*; do
    # skip directories
    if [ -d "$name" ]; then
      continue
    fi

    target="$HOME/$name"

    # unlink symlink if it exists
    if [ -e "$target" ]; then
      echo "Removing symlink $target"
      unlink "$target"
    fi

    echo "Symlinking $name"
    ln -s "$PWD/$name" "$target"
  done
}

symlink_dotfiles
