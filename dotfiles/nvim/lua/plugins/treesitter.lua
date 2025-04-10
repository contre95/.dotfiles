vim.filetype.add({
  extension = { rasi = "rasi" },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/mako/config"] = "dosini",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "BufReadPre", "VimEnter" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    lazy = true,
    build = ":TSUpdate",
    dependencies = "windwp/nvim-ts-autotag",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c",
        "go",
        "css",
        "lua",
        "nix",
        "sql",
        "tsx",
        -- "fga", ":TSInstall fga" works but not adding it here :hmm:
        "vim",
        "xml",
        "bash",
        "diff",
        "html",
        "json",
        "luap",
        "toml",
        "rust",
        "yaml",
        "jsdoc",
        "jsonc",
        "query",
        "regex",
        "luadoc",
        "printf",
        "python",
        "vimdoc",
        "hyprlang",
        "markdown",
        "terraform",
        "javascript",
        "typescript",
        "markdown_inline",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
      },
    },
  },
}
