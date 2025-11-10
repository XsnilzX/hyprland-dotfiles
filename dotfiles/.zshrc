# ===== Basics =====
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups share_history inc_append_history
setopt extendedhistory hist_ignore_space hist_reduce_blanks
setopt autocd extendedglob correct interactivecomments
setopt no_beep auto_pushd pushd_ignore_dups glob_dots
bindkey -e

# ===== PATHS ====
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# ===== Pluginsystem: zinit =====
declare -A ZINIT=(
  [HOME_DIR]="$HOME/.local/share/zinit"
  [BIN_DIR]="$HOME/.local/share/zinit/bin"
)
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# ===== FZF (vor Plugins okay, Completion kommt später in compinit rein) =====
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh

# --- Safety: alte z/zi beseitigen, bevor zoxide kommt ---
unalias z  2>/dev/null; unalias zi 2>/dev/null
unfunction z 2>/dev/null; unfunction zi 2>/dev/null

# --- zoxide (stellt z/zi bereit) ---
eval "$(zoxide init zsh)"

# ===== Zinit Plugins =====
# Inline-Vorschläge
zinit light zsh-users/zsh-autosuggestions
# Syntax-Highlighting (sollte sehr spät/zuletzt kommen)
zinit light zdharma-continuum/fast-syntax-highlighting
# OMZ Plugins / Snippets
zinit snippet OMZP::git
zinit snippet OMZP::archlinux
# Farbige Manpages
zinit light ael-code/zsh-colored-man-pages
# Alias-Hinweise (nur einmal)
zinit light djui/alias-tips
# History-Substring-Search
zinit light zsh-users/zsh-history-substring-search

# ===== Prompt =====
eval "$(starship init zsh)"
<<<<<<< HEAD
# (Aktiviere in ~/.config/starship.toml das Modul `cmd_duration`)
=======
eval "$(zoxide init zsh)"
>>>>>>> fdbf242f8847ce5c3307c0b9223e935c728e67a1

# ===== Completion (nach Plugins!) =====
zmodload zsh/complist
if [[ ! -d ~/.cache/zsh ]]; then mkdir -p ~/.cache/zsh; fi
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'

# ===== Keybindings =====
# Home / End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
# Ctrl + Left/Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Delete/Backspace robust
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
# history-substring-search auf Pfeile
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ===== Aliases =====
alias ls="eza -la --color=always --icons=always --hyperlink"
alias ll='eza -lah --icons --git'
alias grep='grep --color=auto'
alias code="codium --ozone-platform=wayland"
alias hx='helix'

# ===== Nur in interaktiven Shells laufen lassen =====
# (sonst stört es Skripte/SSH/cron)
[[ $- != *i* ]] && return

# Leichter Systembanner
command -v fastfetch >/dev/null 2>&1 && fastfetch

# Externes Env nur sourcen, wenn vorhanden
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
