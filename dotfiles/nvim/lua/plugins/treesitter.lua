return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    -- build = ":TSUpdate",
    dependencies = "windwp/nvim-ts-autotag",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "terraform", "javascript", "html", "python" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
