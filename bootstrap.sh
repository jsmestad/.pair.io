#!/bin/bash
#
# My pairing and pair.io dotfiles bootstrap script.
#
# Usage:
# curl https://raw.github.com/jsmestad/.pair.io/master/bootstrap.sh | /bin/bash

FILES=( bashrc bash_profile zshrc zprofile zshenv gemrc ackrc vimrc gvimrc tmux.conf gitconfig )

OS=`uname | tr '[A-Z]' '[a-z]'`
IAM=$(whoami)
DOT_ROOT=~/.dotfiles
LINK_FN=`which ln`
UNLINK_FN=`which unlink`

echo "Checking to see if your running OSX."
if [ $OS == "darwin" ] && [ -x /usr/local/bin/ln ] && [ -x /usr/local/bin/unlink ]; then
  echo "OSX detected! We require using the \`coreutils\` from homebrew."
  echo "More information on coreutils, see https://github.com/mxcl/homebrew/blob/master/Library/Formula/coreutils.rb"
  LINK_FN=/usr/local/bin/ln
  UNLINK_FN=/usr/local/bin/unlink
fi

echo "Cloning a fresh set of dotfiles from https://github.com/jsmestad/.pair.io"
rm -rf $DOT_ROOT
git clone https://github.com/jsmestad/.pair.io.git $DOT_ROOT

if [ ! -d ~/.oh-my-zsh ]; then
  echo "ZSH configuration is missing. Installing oh-my-zsh."
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ ! -d ~/.vim ]; then
  echo "Vim configuration missing. Installing."
  cd $DOT_ROOT && git submodule update --init
  $LINK_FN -s $DOT_ROOT/vimfiles ~/.vim
fi

echo "Unlinking any files"
for dot_file in "${FILES[@]}"; do
  $UNLINK_FN ~/.$dot_file
  $LINK_FN -s $DOT_ROOT/$dot_file ~/.$dot_file
  echo "Linking: ~/.$dot_file"
done

echo "Updating Vim submodules."
echo "INSTALL COMPLETED. RELOADING THE SHELL."
exec $SHELL
