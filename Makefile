install_nvim:
	sudo apt-get install python-software-properties
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python-dev python-pip python3-dev python3-pip
	pip install neovim
	pip3 install neovim
	sudo apt-get install xclip

install_zsh:
	sydo apt-get install git
	sudo apt-get install zsh

set_default_nvim:
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor
