if has('gui_macvim')
  macmenu &File.New\ Tab key=<nop>

  "stop arrow keys from cancelling selection
  set keymodel=startsel
endif

set guicursor+=n-v-c:blinkon0
set fullscreen
