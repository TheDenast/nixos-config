return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "/run/current-system/sw/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  maxLineLength = 88,  -- Set line length to 88 for Black compatibility
                },
              },
            },
          },
        },
        lua_ls = {
          cmd = {
            "/run/current-system/sw/bin/lua-language-server"
          }
        },
      },
    },
  },
}
