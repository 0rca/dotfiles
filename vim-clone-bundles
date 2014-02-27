#!/bin/sh

cd home/vim/bundle &&
  grep '" Bundle:' ../../vimrc |
    cut -f 3 -d ' ' |
    sed -e 's,^[^/]*$,vim-scripts/&,' -e 's,.*,https://github.com/&.git,' |
    xargs -L1 git clone
