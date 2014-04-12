dotfiles
========
install.sh for the magic!

notes for future matt
=====================

how to add a dependent repo as a subtree
----------------------------------------
```
git remote add -f jpo-vim-railscasts-theme git@github.com:jpo/vim-railscasts-theme.git
git subtree add --prefix vim/colors/jpo-vim-railscasts-theme jpo-vim-railscasts-theme master --squash
```
