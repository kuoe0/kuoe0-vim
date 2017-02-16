#
# Makefile
# KuoE0, 2016-04-19 02:06
#

all: clean install install-plug

install:
	./setup.sh

clean:
	rm -rf ./autoload ./plugged

refresh-plug: clean-plug install-plug

install-plug:
	@echo 'Installing plugins...'
	@vim +PlugInstall! +qa 2> /dev/null

update-plug:
	@echo 'Updating plugins...'
	@vim +PlugUpdate! +qa 2> /dev/null

upgrade-plug:
	@echo 'Upgrading vim-plug...'
	@vim +PlugUpgrade! +qa 2> /dev/null

clean-plug:
	@echo 'Cleaning useless plugins...'
	@vim +PlugClean! +qa 2> /dev/null

# vim:ft=make
#
