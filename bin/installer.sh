#!bin/bash

echo "##### install brew #####"
if [ -z $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi
echo "done"

echo "##### install docker #####"
if [ -z $(which docker) ]; then
  brew install docker
fi
echo "done"

echo "##### install ImageMagick #####"
if [ -z $(which convert) ]; then
  brew install imagemagick
fi
echo "done"
