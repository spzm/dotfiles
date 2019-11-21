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

#
# Section: brew
#
info "Configuring brew"
(
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  cd "${DOTFILES_ROOT}/brew"
  brew bundle
)

# Update submodules
git submodule update --init --recursive

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
  if [ ! -d "zsh-256color" ]; then
    git clone https://github.com/chrissicool/zsh-256color
  fi
)

#
# Section: tmux
#
info "Configuring tmux"

ln -snf "${DOTFILES_ROOT}/tmux/tmux.conf" "${HOME_DIRECTORY}/.tmux.conf"

success "Tmux is configured"


# Finishing

unset DOTFILES_ROOT
unset HOME_DIRECTORY
unset XDG_CONFIG_HOME

success "Configuration finished"

