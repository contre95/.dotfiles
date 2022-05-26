
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
    
  -- Mapping
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
      end, { "i", "s" }),
    },
    -- Windows
     window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },

    -- Sources
    sources =  cmp.config.sources({
      { name = 'path' },
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 3, },
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
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        vsnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = false, -- virtual text
  },
})

 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
 --cmp.setup.cmdline(":", {
  --sources = cmp.config.sources({
    --{
      --name = "path",
    --},
  --}, {
    --{
      --name = "cmdline",
      --max_item_count = 20,
      --keyword_length = 3,
    --},
  --}),
--})

