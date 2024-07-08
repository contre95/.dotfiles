table.unpack = table.unpack or unpack -- 5.1 compatibility
local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local lspkind = require('lspkind')
cmp.setup({
  -- Mapping
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
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
    { name = 'copilot',  group_index = 2 },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'luasnip',    group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'buffer',   keyword_length = 2, },
  }),

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        copilot = "",
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
})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
