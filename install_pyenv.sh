#!/bin/bash

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# Put it to rc file
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

sudo apt-get install python-dev libreadline-dev libbz2-dev libssl-dev libsqlite3-dev libxslt1-dev libxml2-dev

pyenv install 2.7.13
pyenv install 3.6.0

pyenv virtualenv 2.7.13 neovim2
pyenv virtualenv 3.6.0 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python
pyenv deactivate

pyenv activate neovim3
pip install neovim
pyenv which python
pyenv deactivate
