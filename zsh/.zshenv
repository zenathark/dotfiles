export ZSHCONFIG="$ZDOTDIR/.zshrc"

### BOOT Configuration
export BOOT_CLOJURE_VERSION=1.8.0

### rbenv Configuration
export PATH="$HOME/.rbenv/bin:$PATH"

### pyenv Configuration
export PATH="$HOME/.pyenv/bin:$PATH"

### Vagrant config is on a separated file
source $ZDOTDIR/.vagrantrc

case "$OSTYPE" in
    darwin*)
        source $ZDOTDIR/.zshenv-darwin;;
    linux*)
        source $ZDOTDIR/.zshenv-linux;;
esac
