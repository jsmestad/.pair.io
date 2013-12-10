export PATH=$HOME/.rbenv/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s /Users/jsadmin/.nvm/nvm.sh ]] && . /Users/jsadmin/.nvm/nvm.sh # This loads NVM

## rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/shims:$PATH"
#eval "$(rbenv init --no-rehash - zsh)"

#export active_ruby=$(rbenv version-name)

# function rvm () {
  # if [[ $1 == 'use' ]]; then
    # rbenv shell $2
  # fi
# }
