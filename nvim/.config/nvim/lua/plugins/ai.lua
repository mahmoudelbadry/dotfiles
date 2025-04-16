return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "openwebui",
      },
      inline = {
        adapter = "openwebui",
      },
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
    adapters = {
      openwebui = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://ai.mb89.duckdns.org/api",
            api_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImM0ODM1ZDNiLWRiMWEtNDJjYS04YmRlLTZmZGQ2ZTMyNzU4MyJ9.XUDtIRHCXL6ldxymaX3sHee4XcAqcW0YGqEBRZ987R0",
            chat_url = "/chat/completions",
          },
          schema = {
            model = {
              default = "groq/qwen-qwq-32b",
            },
          },
        })
      end,
    },
  },
}
