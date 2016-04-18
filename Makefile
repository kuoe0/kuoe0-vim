#
# Makefile
# KuoE0, 2016-04-19 02:06
#

all: clean install

install:
	@echo 'Installing plugins...'
	@vim +PlugInstall! +qa 2> /dev/null

update:
	@echo 'Updating plugins...'
	@vim +PlugUpdate! +qa 2> /dev/null

upgrade:
	@echo 'Upgrading plug.vim...'
	@vim +PlugUpgrade! +qa 2> /dev/null

clean:
	@echo 'Cleaning useless plugins...'
	@vim +PlugClean! +qa 2> /dev/null

# vim:ft=make
#
