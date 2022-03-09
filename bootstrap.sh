#!/bin/bash
set -x
set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install borkdude/brew/babashka
brew install bat exa fd fzf htop httpie hyperfine gh jq leiningen neovim ripgrep rlwrap sd scmpuff tokei zoxide xh
$(brew --prefix)/opt/fzf/install

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install pynvim
nvim --headless +PlugInstall +qall

git clone https://github.com/romkatv/powerlevel10k.git $HOME

defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

./setup.bb bootstrap
