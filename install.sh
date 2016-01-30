#!/usr/bin/env bash

set -e


# Set variable

ROOT_DIRECTORY=$(pwd -P)
XDG_CONFIG_HOME=~/.config


# Logging functions
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warn () {
  printf "\r\033[2K  [ \033[00;33mWARN\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ""
  exit
}

# Neovim

info "Configuring vim"

curl -fLo ${ROOT_DIRECTORY}/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
success "Vim plugin copied"

mkdir -p ${XDG_CONFIG_HOME}
echo ${ROOT_DIRECTORY}
echo ${XDG_CONFIG_HOME}
ln -snf ${ROOT_DIRECTORY}/nvim ${XDG_CONFIG_HOME}/nvim
success "Config copied"

(
  make set_default_nvim
  success "Nvim is set up as default"
)

vim -i None -c PlugUpdate -c quitall
success "Plugins were installed"

# Finishing

unset ROOT_DIRECTORY

success "Configuration finished"

