Put this repo in the home directory for the user you want to install the vim config on.

You will have to install vim-plug first. Just go to the github and follow the directions there.


1) First look into the makesymlink file, write out the location where your home dir is
   Calling out ~/ gives you root directory on ubuntu, while this will give you home on macos
   This is likely caused by having root

2) Run the makesymlink file.

At first startup of vim you will likely have to call, this loads the vimrc file
It should work to point to the .vimrc in your home folder
:source <point to your vimrc>

then
:PlugInstall

If you add in new Packages, you will want to run
:PlugUpdate
