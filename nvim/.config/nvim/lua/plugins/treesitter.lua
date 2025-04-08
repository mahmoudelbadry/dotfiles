-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "python",
      "lua",
      "javascript",
      "typescript",
      "java",
      "php",
    },
    illuminate = {
      enable = false,
    },
  },
}
