# opengeo-vm
Installation script and settings for Ubuntu Mate 14.04 virtual machine used in workshops

The VM image may be [downloaded from here](https://drive.google.com/open?id=0B61iTbR6VybkcEZjWlNnOVJQX0E).

## Installer
`install_ubuntu_mate.sh` contains all commands used to install software on this VM.

## Software Updater
`WorkshopUpdate.desktop` calls `update_vm.sh` to update software and documents used in the workshop. Software is updated from `git` repositories.

To install the update script, run the `make deploy` target within the `updater` folder. The `Makefile` will create an application (`WorkshopUpdate.desktop`) and add it to list of applications for Ubuntu Mate (e.g., copy to `$HOME/.local/share/applications/`).
