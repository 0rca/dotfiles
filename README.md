# Ultra-lightweight dotfiles

Deployable on barebone box using only `git` and `sh`.

Vim never really complains about missing bundles, so you don't have to install
them, if you don't feel like it.

Bundles are in
[vim-update-bundles](https:/bronson/vim-update-bundles)-compatible format,
although you don't need it to install the tool, either. Use
`vim-clone-bundles` script, instead.

# Requirements
* git

# Miscellaneous
* uses tweaked [gthank's script](https:/gthank/bundle-updater) for updating
  vim bundles

# Someday/maybe
* `git` is too much of a requiement. Use `wget` or `curl` for retrieving
  bundles
* prevent vim from using missing bundles' functions
