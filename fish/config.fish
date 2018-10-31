source ~/.local/share/icons-in-terminal/icons.fish

bass source ~/driveai/build/setup.sh

set -U EDITOR vim

if not type -q 'docker'
  /home/nathan/dotfiles/install
  cd ~/driveai
end
