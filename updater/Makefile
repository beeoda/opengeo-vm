SCRIPT=update_vm.sh
DESKTOP=WorkshopUpdate.desktop

default: deploy

pull:
	git fetch --all
	git reset --hard origin/master

deploy: pull
	/bin/ln -nfs $(shell readlink -f $(SCRIPT)) $(HOME)/.$(SCRIPT)
	cp $(DESKTOP) $(HOME)/.local/share/applications/$(DESKTOP)

clean:
	rm -v $(HOME)/.$(SCRIPT)
	rm -v $(HOME)/.local/share/applications/$(DESKTOP)
