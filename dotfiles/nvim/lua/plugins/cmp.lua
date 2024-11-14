table.unpack = table.unpack
local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local lspkind = require('lspkind')
return {
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "VeryLazy",
    priority = 100,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = {
      -- Mapping
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),

        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end),

      },
      -- Windows
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Sources
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'vsnip' },
        { name = 'copilot', group_index = 2 },
        { name = 'buffer',  keyword_length = 3, },
      }),

      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
      },

      formatting = {
        --format = lspkind.cmp_format({with_text = false, maxwidth = 50})
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            copilot = "[Copilot]",
            buffer = "[Buf]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
            vsnip = "[Snip]",
            gh_issues = "[Issues]",
            tn = "[TabNine]",
          },
        },
      },
      experimental = {
        native_menu = false,
        ghost_text = false, -- virtual text
      },
    },
  },
}
