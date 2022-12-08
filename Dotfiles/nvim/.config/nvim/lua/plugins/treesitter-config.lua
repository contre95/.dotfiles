local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  ensure_installed = {
    "go",
    "css",
    "hcl",
    "lua",
    "bash",
    "help",
    "html",
    "json",
    "rust",
    "toml",
    "yaml",
    "python",
    "rego",
    "markdown",
    --"proto",
    --"graphql",
    "gitcommit",
    "gitignore",
    "javascript",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  }
}
