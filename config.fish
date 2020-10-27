# Path to Oh My Fish install.
set -gx OMF_PATH "/home/wilson/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/wilson.junior/.config/omf"

# virtualfish
set PROJECT_HOME $HOME/Globo
set VIRTUALFISH_COMPAT_ALIASES

set GREP_OPTIONS '--color=always'
set -g theme_display_k8s_context yes

source /usr/lib/python3.6/site-packages/virtualfish/virtual.fish
source /usr/lib/python3.6/site-packages/virtualfish/auto_activation.fish
source /usr/lib/python3.6/site-packages/virtualfish/compat_aliases.fish
source /usr/lib/python3.6/site-packages/virtualfish/global_requirements.fish
source /usr/lib/python3.6/site-packages/virtualfish/projects.fish
source $HOME/.config/fish/completions/kubectl_aliases.fish
emit virtualfish_did_setup_plugins

alias ec='emacsclient -n'
alias t='tsuru'
alias g='git'
alias m='make'
alias wk='workon'
alias pbcopy='xclip -i'
alias stg='git diff --staged'
alias cat='bat'
alias du='ncdu'
alias curl-latency='curl -w "@/home/wilson/.config/curl-latency.txt" -o /dev/null -s'
alias icat='kitty +kitten icat'
alias tprod='tsuru --target=https://tsuru.globoi.com'
alias tlab='tsuru --target=https://lab.tsuru.globoi.com'

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

set -x EDITOR emacsclient

# my personal bins
set -x PATH $HOME/.bin $PATH

# Load oh-my-fish configuration.

source $OMF_PATH/init.fish

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

function __check_nvm --on-variable PWD --description 'Check for .node-version file'
  if test -e .node-version
     nvm use --silent (cat .node-version)
  end
end

if test -e .node-version
    nvm use --silent (cat .node-version)
end

kitty + complete setup fish | source
