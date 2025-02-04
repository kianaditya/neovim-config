return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      -- Go tools
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "delve",
    },
  },
}
