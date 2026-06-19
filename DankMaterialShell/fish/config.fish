if status is-interactive
set fish_greeting
#set -g fish_key_bindings fish_vi_key_bindings

# Initialize zoxide
zoxide init fish | source

# Aliases
alias vim="nvim"
alias ls="lsd --group-directories-first -l"
alias lsa="lsd --group-directories-first -al"
end

fish_add_path /home/kush/.spicetify

# Created by `pipx` on 2026-05-02 22:46:43
set PATH $PATH /home/kush/.local/bin
