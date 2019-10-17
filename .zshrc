export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/rahul/.oh-my-zsh"

plugins=(
git
kube-ps1
)

source $ZSH/oh-my-zsh.sh
export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/grofers-k8s-config

# Promt comfiguration
PROMPT=$PROMPT'$(kube_ps1) '



alias reload_zshrc="source ~/.zshrc"
alias work="cd ~/Desktop/work"
alias edit_zshrc="vim ~/.zshrc"
