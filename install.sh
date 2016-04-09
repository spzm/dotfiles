#!/usr/bin/env bash

set -e


# Set variable

DOTFILES_ROOT=$(pwd -P)
HOME_DIRECTORY=~/
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

# Update submodules
git submodule init
git submodule update


#
# Section: neovim
#
info "Configuring vim"

curl -fLo "${DOTFILES_ROOT}/nvim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

success "Vim plugin copied"

mkdir -p ${XDG_CONFIG_HOME}
echo "${DOTFILES_ROOT}"
echo ${XDG_CONFIG_HOME}
ln -snf "${DOTFILES_ROOT}/nvim" "${XDG_CONFIG_HOME}/nvim"

success "Config has copied"

(
  make set_default_nvim
  success "Nvim is set up as default"
)

vim -i NONE -c PlugUpdate -c quitall
success "Plugins were installed"


#
# Section: git
#
info "Configurig git"

ln -snf "${DOTFILES_ROOT}/git/gitconfig" "${HOME_DIRECTORY}/.gitconfig"
success "Git config has copied"


#
# Section: oh-my-zsh
#
info "Configurig oh-my-zsh"

ln -snf "${DOTFILES_ROOT}/zsh/zshrc" "${HOME_DIRECTORY}/.zshrc"
ln -snf "${DOTFILES_ROOT}/zsh/oh-my-zsh" "${HOME_DIRECTORY}/.oh-my-zsh"
(
  cd "${HOME_DIRECTORY}/.oh-my-zsh/plugins"
  git clone https://github.com/chrissicool/zsh-256color
)
chsh -s /bin/zsh


# Finishing

unset DOTFILES_ROOT
unset HOME_DIRECTORY
unset XDG_CONFIG_HOME

success "Configuration finished"

