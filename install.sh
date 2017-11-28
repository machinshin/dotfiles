git clone --bare https://github.com/machinshin/dotfiles.git $HOME/.dotfiles.git
function config {
   /usr/local/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@
}
mkdir -p .dotfiles.git-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles.git-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


