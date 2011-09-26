# debian flavour
if [ -f /usr/share/autojump/autojump.zsh ]; then
  . /usr/share/autojump/autojump.zsh
fi

# mac os x flavour - not tested
if (`command -v brew >/dev/null`); then
  if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
  fi
fi