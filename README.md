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
When rebasing immediately after adding a squashed subtree (which creates a merge commit), its possible that merge conflicts may be encountered as the squash commit is applied directly to the parent commit which refers to the root of the repository, not the path provided at the time of adding the subtree. 

Theres some info about this [here](http://stackoverflow.com/questions/12858199/how-to-rebase-after-git-subtree-add) and [here](http://stackoverflow.com/questions/15915430/what-exactly-does-gits-rebase-preserve-merges-do-and-why).

To rebase in this scenario:
```
git pull --rebase=preserve
```
