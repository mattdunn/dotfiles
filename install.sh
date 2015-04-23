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

install_vim_plugins(){
  if [ -e "$HOME/.vim/" ]; then
      echo "Removing ~/.vim/"
      rm -rf $HOME/.vim/
  fi

  echo "Copying vim pathogen and plugins"
  mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
  cp -r vim/package/tpope-vim-pathogen/autoload/ $HOME/.vim/autoload
  cp -r vim/package/nerdtree/ $HOME/.vim/bundle/nerdtree
  cp -r vim/colors/ $HOME/.vim/bundle
}

symlink_dotfiles
install_vim_plugins
