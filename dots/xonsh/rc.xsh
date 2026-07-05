import os

# init zoxide
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')

# Aliases
aliases['cd'] = 'z'
aliases['zz'] = 'yazi'
aliases['ll'] = 'eza -lh --group-directories-first --icons --no-permissions --no-user'
aliases['sl'] = 'sl -w -10 -d'

# Complex multi-command alias
aliases['mgs'] = """
mgitstatus -d 3 --no-upstream -c /home/denast/.nixos-config/ /home/denast/.dots/ | sed 's/\\/home\\/denast\\///'; \
mgitstatus -d 3 --no-upstream -c /home/denast/Pictures/ | sed 's/\\/home\\/denast\\/Pictures\\///'; \
mgitstatus -d 3 --no-upstream -c /home/denast/Projects/ | sed 's/\\/home\\/denast\\/Projects\\///';
"""

# Neovim as default editor
$EDITOR = "nvim"

# Add cargo to path
$PATH.append(os.path.expanduser('~/.cargo/bin'))

# init direnv
# execx($(direnv hook xonsh))

# init startship
execx($(starship init xonsh))
