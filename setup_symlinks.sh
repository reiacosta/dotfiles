ln -s ~/bt/dotfiles/ssh_config ~/.ssh/config
ln -s ~/bt/dotfiles/aliases ~/.aliases
ln -s ~/bt/dotfiles/git.plugin.zsh ~/.git.plugin.zsh
ln -s ~/bt/dotfiles/gemrc ~/.gemrc
ln -s ~/bt/dotfiles/gitconfig ~/.gitconfig
ln -s ~/bt/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/bt/dotfiles/zshrc ~/.zshrc
ln -s ~/bt/dotfiles/git-authors ~/.git-authors
ln -s ~/bt/dotfiles/gorc ~/.gorc
ln -s ~/bt/dotfiles/pryrc ~/.pryrc

if [[ $(uname) -ne "Linux" ]]; then 
  ln -s ~/bt/dotfiles/github.gitconfig ~/.github.gitconfig
  cat <<-EOF
Please create a .netrc file in your home directory with the following contents:
machine github.com
  login # your github username
  password # generate access token from https://github.com/settings/tokens
EOF
fi

git clone https://github.com/braintreeps/vim_dotfiles.git ~/.vim

cd ~/.vim
./activate.sh
