#
# Makefile
# KuoE0, 2016-04-19 02:06
#

install:
	./install.sh

plugin_refresh: plugin_clean plugin_install

plugin_install:
	@echo 'Installing plugins...'
	@vim +PlugInstall! +qa 2> /dev/null

plugin_update:
	@echo 'Updating plugins...'
	@vim +PlugUpdate! +qa 2> /dev/null

plugin_upgrade:
	@echo 'Upgrading plug.vim...'
	@vim +PlugUpgrade! +qa 2> /dev/null

plugin_clean:
	@echo 'Cleaning useless plugins...'
	@vim +PlugClean! +qa 2> /dev/null

# vim:ft=make
#
