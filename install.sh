#!/usr/bin/env bash

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
# Section: Homebrew
#
info "Configuring Homebrew"
(
  if which brew >/dev/null; then
    echo "Homebrew is already installed. Skipping."
  else
    echo "Installing homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  cd "${DOTFILES_ROOT}/brew"
  brew bundle
)
success "Homebrew config has completed"

#
# Section: fish
#
# info "Configuring fish"
# (
  # install oh-my-fish
  # SCRIPT_NAME="install-fish"
  # curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > "$SCRIPT_NAME"
  # fish "$SCRIPT_NAME" --yes
  # rm "$SCRIPT_NAME"
# )

#
# Section: kitty terminal
#
info "Configurig kitty terminal"
(
  ln -snf "$DOTFILES_ROOT/kitty" "$HOME_DIRECTORY/.config/kitty"
)
success "Kitty config has completed"

#
# Section: nvim
#
info "Configuring neovim"
(
 ln -sfn "$DOTFILES_ROOT/nvim" "$HOME_DIRECTORY/.config/nvim"
)
success "Neovim config has completed"

#
# Section: tmux
#
info "Configuring tmux"
(
  ln -snf "$DOTFILES_ROOT/tmux/tmux.conf" "$HOME_DIRECTORY/.tmux.conf"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
)
success "Tmux config has completed"

#
# Section: git
#
info "Configurig git"
(
  ln -snf "$DOTFILES_ROOT/git/gitconfig" "$HOME_DIRECTORY/.gitconfig"
)
success "Git config has completed"

# Finishing

unset DOTFILES_ROOT
unset HOME_DIRECTORY
unset XDG_CONFIG_HOME

success "Configuration finished"

