# »»————-　★　STARSHIP ————-««
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# »»————-　★　CONFIG STUFFS ————-««
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BAT_THEME="catppuccin-mocha"
export EZA_CONFIG_DIR="$HOME/.config/eza"
export EDITOR="nvim"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# »»————-　★　PATH EXPORTS ————-««
export PATH="/Users/maximebegaud/.local/bin:$PATH"

# »»————-　★　NVIM ————-««
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# »»————-　★　SOURCE ALIASES ————-««
for aliasfile in $HOME/.config/zsh/aliases/*.zsh; do
    source $aliasfile
done

# »»————-　★　FZF CONFIG————-««
eval "$(fzf --zsh)"

# Hiding things stuffing the previews and fuzzy searching for nothing
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude node_modules --exclude venv --exclude .venv --exclude __pycache__ --exclude build --exclude dist --exclude .cache --exclude cache --exclude Caches --exclude Cache"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="
	--color=fg:#cdd6f4,hl:#f38ba8
	--color=fg+:#f5e0dc,bg+:#313244,hl+:#f38ba8
	--color=border:#45475a,header:#a6e3a1,gutter:#181825
	--color=spinner:#f9e2af,info:#89b4fa
	--color=pointer:#cba6f7,marker:#f38ba8,prompt:#a6e3a1"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# This makes the folder preview using eza's tree basic configuration
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_CTRL_R_OPTS="--layout=reverse"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# »»————-　★　ZOXIDE ————-««
eval "$(zoxide init zsh)"
