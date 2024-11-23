return {
  {
    "nvimtools/none-ls.nvim",
    -- event = "VeryLazy",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
          or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.hover.dictionary,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.yamlfmt,
        nls.builtins.formatting.prettier, -- JSON formatting
        nls.builtins.diagnostics.jsonlint, -- JSON diagnostics
      })
    end
  },
}
