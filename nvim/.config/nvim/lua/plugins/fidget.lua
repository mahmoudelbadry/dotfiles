return {
  {
    "j-hui/fidget.nvim",
    lazy = false,
    event = "LspAttach",
    config = function() require("fidget").setup {} end,
  },
}
