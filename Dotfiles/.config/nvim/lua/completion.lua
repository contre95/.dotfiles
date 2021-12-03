  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  cmp.setup({

    mapping = {
  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    },

    sources =  cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer', keyword_length = 3, }
    }),

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

   formatting = {         
    --format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },

  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = true,
  },
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline('/', {
      --cmp.config.sources({
    --{ name = "nvim_lsp_document_symbol" },
      --}, {
         --{ name = "buffer"},
     --})
  --})

 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    {
      name = "path",
    },
  }, {
    {
      name = "cmdline",
      max_item_count = 20,
      keyword_length = 3,
    },
  }),
})

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --capabilities = capabilities
  --}
