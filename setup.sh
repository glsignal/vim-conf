if which git &> /dev/null; then
  echo "Fetching submodules"
  git submodule update --init
else
  echo "Please install git"
fi

CURRENT_DIR=$(pwd)

echo "Linking $HOME/.vim          -> $CURRENT_DIR"
ln -s "$CURRENT_DIR" "$HOME/.vim"

echo "Linking $HOME/.vimrc        -> $CURRENT_DIR/vimrc"
ln -s "$CURRENT_DIR/vimrc" "$HOME/.vimrc"

echo "Done!"
