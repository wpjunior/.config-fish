# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/wilson.junior/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/wilson.junior/.config/omf"

# homebrew
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;


# gpg fix
set -x GPG_TTY (tty)

# virtualfish
set PROJECT_HOME $HOME/QA
set VIRTUALFISH_COMPAT_ALIASES

set GREP_OPTIONS '--color=always'
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_git_default_branches main trunk master

# source /Users/wilson.junior/Library/Python/3.9/lib/python/site-packages/virtualfish/virtual.fish
# source /Users/wilson.junior/Library/Python/3.9/lib/python/site-packages/virtualfish/auto_activation.fish
# source /Users/wilson.junior/Library/Python/3.9/lib/python/site-packages/virtualfish/compat_aliases.fish
# source /Users/wilson.junior/Library/Python/3.9/lib/python/site-packages/virtualfish/global_requirements.fish
# source /Users/wilson.junior/Library/Python/3.9/lib/python/site-packages/virtualfish/projects.fish
source $HOME/.config/fish/completions/kubectl_aliases.fish
emit virtualfish_did_setup_plugins

alias ec='emacsclient -n'
alias t='tsuru'
alias g='git'
alias m='make'
alias cat='bat -p'
alias du='ncdu'
alias tf='terraform'


# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# mac stuff
set -x PATH /usr/local/bin $PATH
set -x PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
set -x PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH
set -x PATH /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/ $PATH

set -x EDITOR emacsclient

# Load oh-my-fish configuration.

source $OMF_PATH/init.fish

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

function gssh
    gcloud compute ssh $argv[2] --project $argv[1] --internal-ip
end

function __check_nvm --on-variable PWD --description 'Check for .node-version file'
  if test -e .node-version
     nvm use --silent (cat .node-version)
  end
end

if test -e .node-version
    nvm use --silent (cat .node-version)
end

# kitty + complete setup fish | source


# https://rvm.io/integration/fish
# curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
# rvm default