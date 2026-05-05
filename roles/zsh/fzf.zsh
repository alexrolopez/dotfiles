# Set up fzf key bindings and fuzzy completion
if fzf --zsh >/dev/null 2>&1; then
  source <(fzf --zsh)
else
  [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
  [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
fi

if command -v fd >/dev/null 2>&1; then
  FZF_FD_COMMAND="fd"
elif command -v fdfind >/dev/null 2>&1; then
  FZF_FD_COMMAND="fdfind"
else
  FZF_FD_COMMAND="find"
fi

if command -v bat >/dev/null 2>&1; then
  FZF_BAT_COMMAND="bat"
elif command -v batcat >/dev/null 2>&1; then
  FZF_BAT_COMMAND="batcat"
else
  FZF_BAT_COMMAND="cat"
fi

if [[ "$FZF_FD_COMMAND" == "find" ]]; then
  export FZF_DEFAULT_COMMAND="find . -path '*/.git' -prune -o -print"
  export FZF_ALT_C_COMMAND="find . -path '*/.git' -prune -o -type d -print"
else
  export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND --hidden --follow --exclude .git"
  export FZF_ALT_C_COMMAND="$FZF_FD_COMMAND --type d --hidden --follow --exclude .git"
fi
export FZF_DEFAULT_OPTS="--bind='ctrl-b:preview-page-up' --bind='ctrl-f:preview-page-down'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_PREVIEW_COMMAND="file -biL {} | grep 'charset=binary' | grep -v 'inode/directory' > /dev/null && (file -bL {} ; file -biL {}) || ($FZF_BAT_COMMAND --style=numbers,changes --wrap=never --color=always {} || cat {} || tree -alC --noreport {})"
export FZF_CTRL_T_OPTS="--preview '($FZF_CTRL_T_PREVIEW_COMMAND) 2> /dev/null'"

export FZF_ALT_C_OPTS="--preview 'tree -alC --noreport {}'"
