git clone --bare https://github.com/machinshin/dotfiles.git $HOME/.dotfgit
function config {
   /usr/local/bin/git --git-dir=$HOME/.dotfgit/ --work-tree=$HOME $@
}
mkdir -p .dotfgit-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfgit-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
