# rakr dotfiles

## brew

git
neovim/neovim/neovim
zsh
elixir
the_silver_searcher
python
python3
ctags
zsh-completions
rbenv
ruby-build

zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting


## brew casks

iterm2
marked

## Apple Command Line tools

```
$ xcode-select --install
```

## Neovim

```
brew tap neovim/neovim
brew install neovim --HEAD --with-release
brew install python3
pip2 install neovim
pip3 install neovim
```


## ZSH

### Install

Install with homebrew

```
$ brew install zsh
```

### Set ZSH as the default shell

To be able to use this shell, add its full pathname to `/etc/shells`

```
/usr/local/bin/zsh
```

To enable this new shell, fire the following command:

```
$ chsh -s /usr/local/bin/zsh
```

### Configuration

To make ZSH comply with the XDG Base Directory Specification, ie. zsh configuration folder being `~/.config/zsh`

```
$ ln -s <path_to_this_repo_zsh_env> ~/.zshenv
```

Execute the following commands to install the missing packages

```
$ brew install zsh-autosuggestions zsh-completions zsh-syntax-highlighting
```

`compaudit` may complain about insecure folder, run the following commands to solve this issue (On Mac OS Sierra)

```
$ cd /usr/local/share/
$ sudo chmod -R 755 zsh
$ sudo chown -R root:staff zsh
```


