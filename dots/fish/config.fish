if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
bind \eL 'clear && bfetch'
zoxide init fish | source
alias cd="z"
alias zz="yazi"
alias gg="lazygit"
alias ll="eza -lh --group-directories-first --icons --no-permissions --no-user"
alias cnvim='function _cnvim; z $argv; nvim .; end; _cnvim'
alias mgs="mgitstatus -d 3 --no-upstream -c /home/denast/files '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config/dots/nvim' | sed 's|.*/\([^/:]*\):|\1:|' | sort -t'-' -k1 -n"
alias nixos-update="nix flake update --flake '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config' && sudo nixos-rebuild switch --flake '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config#framework-13' && git -C '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config' add flake.lock && git -C '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config' commit -m '[flake] Chore: update inputs'"
alias sl='sl -w -10 -d'
alias vpn-browser="bash '/home/denast/files/3_technology/30_configs/30-00_\$nixos-config/dots/scripts/tailscale-vpn-browser.sh'"
alias aclaude='CLAUDE_CONFIG_DIR=~/.amplified-claude claude'
setenv EDITOR nvim
source /home/denast/.secrets/api-keys.fish
fish_add_path $HOME/.cargo/bin
direnv hook fish | source
