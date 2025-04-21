return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "openwebui",
      },
      inline = {
        adapter = "openwebui",
      },
      cmd = {
        adapter = "openwebui",
      },
      workflow = {
        adapter = "openwebui",
      },
    },
    adapters = {
      openwebui = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = os.getenv("OPEN_WEB_UI_API_URL"),
            api_key = os.getenv("OPEN_WEB_UI_API_KEY"),
            chat_url = "/chat/completions",
            models_endpoint = "/models",
          },
          schema = {
            model = {
              default = "groq/qwen-qwq-32b", -- define llm model to be used
            },
          },
        })
      end,
    },
  },
  init = function()
    require("plugins.ai.fidget-spinner"):init()
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
}
