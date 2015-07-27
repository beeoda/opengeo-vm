SCRIPT=update_vm.sh
DESKTOP=WorkshopUpdate.desktop

default: all

all: clean pull deploy

pull:
	git fetch --all
	git reset --hard origin/master

deploy: 
	/bin/ln -nfs $(shell readlink -f $(SCRIPT)) $(HOME)/.$(SCRIPT)
	cp $(DESKTOP) $(HOME)/.local/share/applications/$(DESKTOP)

clean:
	rm -fv $(HOME)/.$(SCRIPT)
	rm -fv $(HOME)/.local/share/applications/$(DESKTOP)
