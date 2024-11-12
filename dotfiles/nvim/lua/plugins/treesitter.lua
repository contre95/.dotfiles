return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    -- build = ":TSUpdate",
    dependencies = "windwp/nvim-ts-autotag",
    opts = {},
  },
}
