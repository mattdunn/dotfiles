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
  cp -r vim/package/command-t/ $HOME/.vim/bundle/command-t
  cp -r vim/colors/ $HOME/.vim/bundle

  # compile c extension for command-t vim package
  # nb: the version of ruby invoked here needs to be the same
  #     as the version that vim was installed/compiled against
  #     i.e. the system version
  pushd .
  cd $HOME/.vim/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
  popd
}

symlink_dotfiles
install_vim_plugins
