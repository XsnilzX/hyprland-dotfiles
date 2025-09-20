# ===== Basics =====
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups share_history inc_append_history
setopt autocd extendedglob correct
bindkey -e

# ===== PATHS ====
# Cargo Binaries
export PATH="$HOME/.cargo/bin:$PATH"

# ===== Completion (gecached für Speed) =====
zmodload zsh/complist
autoload -Uz compinit
if [[ ! -d ~/.cache/zsh ]]; then mkdir -p ~/.cache/zsh; fi
compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# ===== fzf (History, Dateien, Git-Branches etc.) =====
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ===== zinit laden =====
declare -A ZINIT=(
  [HOME_DIR]="$HOME/.local/share/zinit"
  [BIN_DIR]="$HOME/.local/share/zinit/bin"
)
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# ===== Plugins =====
# Inline Vorschläge (wie fish)
zinit light zsh-users/zsh-autosuggestions

# Syntax Highlighting (schnellste Variante)
zinit light zdharma-continuum/fast-syntax-highlighting

# Verbesserte Completion (falls nicht schon per pacman installiert)
# zinit light zsh-users/zsh-completions

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# viele Aliases: gst=git status, gco=git checkout, gl=git pull …
zinit snippet OMZP::git

# Farbige Manpages
zinit light ael-code/zsh-colored-man-pages

# Zeigt Tipp, wenn du Alias statt Befehl nutzen könntest
zinit light djui/alias-tips

# Autocomplete & Aliases für pacman
zinit snippet OMZP::archlinux

# Zeigt dir Kommando-Dauer, wenn ein Befehl länger als 10s läuft
zinit light djui/alias-tips

# Nützliche Shortcuts: history-substring-search (Pfeile hoch/runter für Filter)
zinit light zsh-users/zsh-history-substring-search

# Schnell zwischen häufig genutzten Ordnern springen ("z foo" springt zu ~/Projekte/foo)
zinit light agkozak/zsh-z

# Zeigt Git-Infos im Prompt (wenn du keinen P10k nutzt)
zinit light rupa/z

# ===== Starship Prompt =====
eval "$(starship init zsh)"

# ===== Aliases (Beispiel) =====
alias ll='ls -alh --color=auto'
alias grep='grep --color=auto'
alias ls="eza -la --color=always --icons=always --hyperlink"
alias code="codium --ozone-platform=wayland"
alias hx='helix'

fastfetch
