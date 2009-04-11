VIM_FILES	=.vimrc .vim
ZSH_FILES	=.zshrc
X11_FILES	=.Xdefaults

all: 
	@echo "Nothing to do.  Use make import or make install"

install: vim_install zsh_install x11_install

vim_install: $(VIM_FILES)
	cp -R $^ $(HOME)

zsh_install: $(ZSH_FILES)
	cp -R $^ $(HOME)

x11_install: $(X11_FILES)
	cp -R $^ $(HOME)

.PHONY: install vim_install zsh_install x11_install
