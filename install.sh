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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  cd "${DOTFILES_ROOT}/brew"
  brew bundle
)

# Update submodules
git submodule update --init --recursive

#
# Section: fish
#
info "Configuring fish"
(
  # install oh-my-fish
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
)


#
# Section: nvim
#
info "Configuring nvim"
(
 ln -sfn "$DOTFILES_ROOT/nvim" "$HOME_DIRECTORY/.config/nvim"
)

#
# Section: tmux
#
info "Configuring tmux"
(
  ln -snf "$DOTFILES_ROOT/tmux/tmux.conf" "$HOME_DIRECTORY/.tmux.conf"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
)

#
# Section: git
#
info "Configurig git"

ln -snf "$DOTFILES_ROOT/git/gitconfig" "$HOME_DIRECTORY/.gitconfig"
success "Git config has copied"

# Finishing

unset DOTFILES_ROOT
unset HOME_DIRECTORY
unset XDG_CONFIG_HOME

success "Configuration finished"

