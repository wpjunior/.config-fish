# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/wilson.junior/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/wilson.junior/.config/omf"

# virtualfish
set PROJECT_HOME $HOME/Globo
set VIRTUALFISH_COMPAT_ALIASES

source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/virtualfish/virtual.fish
source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/virtualfish/auto_activation.fish
source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/virtualfish/compat_aliases.fish
source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/virtualfish/global_requirements.fish
source /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/virtualfish/projects.fish
emit virtualfish_did_setup_plugins

alias ec='emacsclient -n'
alias t='tsuru'
alias g='git'

# Go
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH

# Load oh-my-fish configuration.

source $OMF_PATH/init.fish

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end