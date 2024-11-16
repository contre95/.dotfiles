return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    lazy = false,
    build = ":TSUpdate",
    dependencies = "windwp/nvim-ts-autotag",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "terraform", "javascript", "html", "python", "yaml", "json", "toml", "nix", "sql", ""},
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
