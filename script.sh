
#!/bin/bash

if test ! $(which brew); then
  echo "Wait, while Homebrew is installing"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_apps=(
  'Caskroom/cask/osxfuse'
  'homebrew/dupes/grep'
  'caskroom/cask/brew-cask'
  bash
  findutils
  imagemagick
  coreutils
  webkit2png
  rename
  zopfli
  ffmpeg
  sshfs
  node
  tree
  ack
  hub
  git
)

brew install ${brew_apps[@]}

echo export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" >> ~/.bash_profile
echo export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" >> ~/.bash_profile
#Not working
#echo alias ls="'ls --color'" >> ~/.bash_profile
source ~/.bash_profile


cask_apps=(
  evernote
  dropbox
  google-chrome
  qlcolorcode
  screenflick
  on-the-job
  slack
  transmit
  appcleaner
  firefox
  qlmarkdown
  spotify
  vagrant
  flash
  iterm2
  qlprettypatch
  virtualbox
  flux
  mailbox
  qlstephen
  vlc
  quicklook-json
  skype
  utorrent
  the-unarchiver
  sidestep
  cheatsheet
  calibre
  steam
  sublime-text
  battery-guardian
)
echo "wait..."
brew cask install --appdir="/Applications" ${cask_apps[@]}


#install ruby on rails env
ror_env(){
  clear
  echo "Installing ror..."
  brew install rbenv ruby-build
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile
  rbenv install 2.1.5
  rbenv global 2.1.5
  gem install rails
  rbenv rehash
  gem install bundler
}
clear
printf "Are you a ruby on rails dev? (y/n)"

read -r ror

case $ror in
  [yY] | [yY][Ee][Ss] )
     ror_env
     ;;
  *)
esac

