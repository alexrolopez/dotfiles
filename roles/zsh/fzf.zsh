# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--bind='ctrl-b:preview-page-up' --bind='ctrl-f:preview-page-down'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_PREVIEW_COMMAND="file -biL {} | grep 'charset=binary' | grep -v 'inode/directory' > /dev/null && (file -bL {} ; file -biL {}) || (batcat --style=numbers,changes --wrap=never --color=always {} || cat {} || tree -alC --noreport {})"
export FZF_CTRL_T_OPTS="--preview '($FZF_CTRL_T_PREVIEW_COMMAND) 2> /dev/null'"

export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -alC --noreport {}'"
