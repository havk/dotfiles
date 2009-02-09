all: 
	@echo "Nothing to do.  Use make import or make install"

import: $(HOME)/.zshrc $(HOME)/.Xdefaults $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.gvimrc
	cp -R $(.ALLSRC) .

install: vim_install zsh_install X11_install

vim_install: .vimrc .gvimrc .vim
	cp -R $(.ALLSRC) $(HOME)

zsh_install: .zshrc
	install $(.ALLSRC) $(HOME)

X11_install: .Xdefaults
	install $(.ALLSRC) $(HOME)

