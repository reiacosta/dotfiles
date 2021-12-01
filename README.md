# Shared dotfiles

Shared dotfiles for laptops and cpairs.


## To use on your laptop (MacOS). From [the onboarding trello card](https://trello.com/c/RQciJjEw/18-symlink-shared-config-files).


### Clone the repo

```
mkdir -p ~/bt
cd ~/bt
git clone git@github.braintreeps.com:braintree/dotfiles.git
```

### Automatic setup

Before running the setup script, check to see if your VIM version is >8.0 and if it isn't, run `brew install vim`.

Run this script to clone the repos and set up the symlinks:

**DANGER: This is destructive!** If you have an existing dotfile on your machine please read through and adjust this script as necessary.

```
~/bt/dotfiles/setup_symlinks.sh
```

### Manual setup (optional)

If you encounter issues with the script, the manual steps are below:

Then symlink at least these config files (or source them in your existing config files if you want to keep your local changes):

```
ln -s ~/bt/dotfiles/ssh_config ~/.ssh/config
ln -s ~/bt/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/bt/dotfiles/zshrc ~/.zshrc

git clone https://github.com/braintreeps/vim_dotfiles.git ~/.vim
cd ~/.vim
./activate.sh
```
and possibly also these:

```
ln -s ~/bt/dotfiles/aliases ~/.aliases
ln -s ~/bt/dotfiles/gemrc ~/.gemrc
ln -s ~/bt/dotfiles/gitconfig ~/.gitconfig
```

## Cpairs

You don't have to do anything on cpairs to use these dotfiles. They are already baked in.

See [cosmos/cpair-image/ansible/tasks/dotfiles.yml](https://github.braintreeps.com/cosmos/cpair-image/blob/a03d75e421903995236a4b8d5046cde8f98cbeb3/ansible/tasks/dotfiles.yml) for details.

## History

These dotfiles were extracted from the `pairing_stations` directory of https://github.braintreeps.com/braintree/system-scripts by running:

```
git filter-branch --prune-empty --subdirectory-filter pairing_stations master
```

This separates out the ever-changing dotfiles from the rest of the largely defunct repo.
