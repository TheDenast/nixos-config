return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- version = false,
  -- opts = {},
  opts = {
    -- provider = "openai", -- Set provider to OpenAI
    -- openai = {
    --   model = "gpt-4", -- GPT-4 model
    --   temperature = 0, -- Adjust as needed
    --   max_tokens = 4096, -- Adjust based on your need
    -- },
    provider = "claude", -- Recommend using Claude
    auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20240620",
      temperature = 0.3,
      max_tokens = 4096,
    },-- Other configuration options here
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- Optional
    "zbirenbaum/copilot.lua", -- Optional for auto-suggestions
  },
}
