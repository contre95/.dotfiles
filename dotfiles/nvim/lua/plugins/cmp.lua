return { -- Autocompletion
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      "L3MON4D3/LuaSnip",
      -- build = (function()
      --   -- Build Step is needed for regex support in snippets.
      --   -- This step is not supported in many windows environments.
      --   -- Remove the below condition to re-enable on windows.
      --   if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
      --     return
      --   end
      --   return "make install_jsregexp"
      -- end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
    "saadparwaiz1/cmp_luasnip",
    "codeium.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-path",
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    local lspkind = require("lspkind")
    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
      Copilot = "",
    }
    -- See `:help cmp`
    require("luasnip/loaders/from_vscode").lazy_load()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({})
    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ["<C-n>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-m>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "codeium" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "path" },
        { name = "cmdline" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
            codeium = "[Codeium]",
            vsnip = "[snip]",
            gh_issues = "[issues]",
            tn = "[TabNine]",
          },
        }),
      },
    })
  end,
}
