# if status is-interactive
# # Commands to run in interactive sessions can go here
# end
#
#
#
# ─────────────────────────────────────────────
# Interactive check (Fish does this by default)
# ─────────────────────────────────────────────

# ─────────────────────────────────────────────
# History settings
# ─────────────────────────────────────────────
set -g fish_greeting ""

set -g fish_history default

set -Ux EDITOR nvim

# Better: history-based suggestion cycling
# bind -M insert \cj history-search-forward
# bind -M insert \ck history-search-backward

bind -M insert \cl accept-autosuggestion
bind -M insert \ck history-search-backward
bind -M insert \cj history-search-forward

# ─────────────────────────────────────────────
# Enable VI mode
# ─────────────────────────────────────────────
fish_vi_key_bindings

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────
alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias more="less"

alias vi="nvim"
alias nv="nvim"

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Colored tools (Fish handles color automatically)
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# ─────────────────────────────────────────────
# PATH configuration
# (Fish uses fish_add_path — much safer than export)
# ─────────────────────────────────────────────
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/solana/install/active_release/bin
fish_add_path $HOME/.foundry/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin

# Cargo env (safe to source)
# if test -f $HOME/.cargo/env
#     source $HOME/.cargo/env
# end

# ─────────────────────────────────────────────
# yazi function (translated correctly)
# ─────────────────────────────────────────────
function y
    set tmp (mktemp -t yazi-cwd.XXXXXX)

    yazi $argv --cwd-file="$tmp"

    if test -f "$tmp"
        set cwd (cat "$tmp")
        if test -n "$cwd" -a "$cwd" != "$PWD"
            cd "$cwd"
        end
        rm -f "$tmp"
    end
end

# ─────────────────────────────────────────────
# yazi function (translated correctly)
# ─────────────────────────────────────────────

function fish_user_key_bindings
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

# ─────────────────────────────────────────────
# ex — archive extractor
# ─────────────────────────────────────────────
function ex
    if test -f $argv[1]
        switch $argv[1]
            case "*.tar.bz2"
                tar xjf $argv[1]
            case "*.tar.gz"
                tar xzf $argv[1]
            case "*.bz2"
                bunzip2 $argv[1]
            case "*.rar"
                unrar x $argv[1]
            case "*.gz"
                gunzip $argv[1]
            case "*.tar"
                tar xf $argv[1]
            case "*.tbz2"
                tar xjf $argv[1]
            case "*.tgz"
                tar xzf $argv[1]
            case "*.zip"
                unzip $argv[1]
            case "*.Z"
                uncompress $argv[1]
            case "*.7z"
                7z x $argv[1]
            case "*"
                echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end


starship init fish | source



