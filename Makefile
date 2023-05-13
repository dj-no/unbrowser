VERSION = 0.666
ifeq ($(PREFIX),)
    PREFIX := $(HOME)/.local
endif

unbrowser: unbrowser.c
	@gcc -o unbrowser unbrowser.c -I.
install: unbrowser
	@install -m 755 unbrowser $(PREFIX)/bin
	@install -m 755 unbrowser.desktop $(PREFIX)/share/applications/unbrowser.desktop
uninstall:
	@rm -f $(PREFIX)/bin/unbrowser
	@rm -f $(PREFIX)/share/applications/unbrowser.desktop
clean:
	@rm -f unbrowser
