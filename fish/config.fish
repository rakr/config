set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# Set TERM for tmux essentially
set -gx TERM xterm-256color-italic;

# vi mode
# fish_vi_key_bindings

source ~/.iterm2_shell_integration.fish

# rbenv
set RBENV_ROOT -x /usr/local/var/rbenv
rbenv init - | source

# nodebrew
# set -x PATH $HOME/.nodebrew/current/bin $PATH

# plugins
set fish_plugins theme git rbenv rails brew bundler gem osx pbcopy better-alias

# abbr list
abbr -a be bundle exec
abbr -a g git
abbr -a gb git branch
abbr -a gc git checkout
abbr -a gs git status
abbr -a o open
abbr -a :e nvim
