-- stylua: ignore
if true then return {} end

return {
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Setup lsp-zero with the 'global' option for NixOS compatibility
      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        call_servers = 'global',  -- Use global LSP servers instead of Mason-installed ones
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

       -- Use nvim-lspconfig's native setup for basedpyright
      local lspconfig = require('lspconfig')
      lspconfig.basedpyright.setup{}

      -- Configure Ruff to run in language server mode
      -- lsp.configure('ruff_lsp', {
      --   cmd = { "/run/current-system/sw/bin/ruff", "server" },
      -- })

      -- Setup lsp-zero
      lsp.setup()
    end,
  },
}
