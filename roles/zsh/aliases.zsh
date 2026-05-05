alias q="cd ..; ls"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
elif command -v batcat >/dev/null 2>&1; then
  alias cat="batcat"
fi

if command -v eza >/dev/null 2>&1; then
  alias ls="eza"
  alias ll="eza -la"
  alias tree="eza --tree"
else
  alias ll="ls -la"
fi
