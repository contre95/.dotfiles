local lspconfig = require("lspconfig")
local util = require 'lspconfig.util'
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP settings (for overriding per client)
local signs = { Error = "❌", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- General attachment callback funtion

-- Diagnosticis Signs
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}


local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- LSP settings (for overriding per client)latin
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

vim.diagnostic.config({
  virtual_text = {
    prefix = " ",
    spacing = 0,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Linters, Prettiers and Checkers for EFM
-----------------------------
-- ES Linter -- npm i -g eslint_d
local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
  lintSource = "eslint",
}

-- General prettier -- npm i -g prettier
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

-- Yaml linter -- brew install yamllint
local yamllint = {
  --lintCommand = "yamllint --format parsable ${INPUT}",
  formatCommand = "cat ${INPUT} | yamlfmt -in",
  lintStdin = true,
}

-- Shell Formatter / Checker
local shell = {
  formatCommand = "shfmt ${-i:tabWidth}",
  lintCommand = "shellcheck -f gcc -x -",
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c: %trror: %m",
    "%f:%l:%c: %tarning: %m",
    "%f:%l:%c: %tote: %m",
  },
}

-- Languages Configuration
-----------------------------

--Json
lspconfig.jsonls.setup({ capabilities = capabilities })

-- Lua
-- https://github.com/sumneko/lua-language-server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua'
        }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Markdown
require 'lspconfig'.marksman.setup {}
-- C

lspconfig.ccls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c" },
})

-- Rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rs", "rust" },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})

-- Python
lspconfig.pyright.setup({ capabilities = capabilities, handlers = handlers })

-- Golang
lspconfig.gopls.setup({ capabilities = capabilities })

-- Terraform
--
lspconfig.tflint.setup({
  flags = { debounce_text_changes = 150 },
})

lspconfig.terraformls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
  end,
  cmd = { "terraform-ls", "serve" },
  filetypes = { "tf", "terraform" },
})

-- SQL  -- go install github.com/lighttiger2505/sqls@latest
lspconfig.sqlls.setup({
  cmd = {'sql-language-server', 'up', '--method', 'stdio'},
  capabilities = capabilities,
})

-- -- Dart
-- require("flutter-tools").setup {
--     flutter_path="/usr/bin/dart",
-- 	lsp = {
-- 		on_attach = on_attach,
-- 		    color = { -- show the derived colours for dart variables
--       enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
--       virtual_text = true, -- show the highlight using virtual text
--       virtual_text_str = "■", -- the virtual text character to highlight
--     },
-- 	},
--   debugger = {
--     enabled = true,
--     run_via_dap = false,
--   },
--   dev_log = {
--     enabled = true,
--   },
-- 	-- widget_guides = {
-- 	-- 	enabled = true,
-- 	-- },
-- }

-- Typescript
--lspconfig.tsserver.setup({ capabilities = capabilities })

-- Emmet
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
-- Vue
lspconfig.vuels.setup {
  on_attach = function(client)
    --[[
                Internal Vetur formatting is not supported out of the box

                This line below is required if you:
                    - want to format using Nvim's native `vim.lsp.buf.formatting**()`
                    - want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
            --]]
    client.server_capabilities.document_formatting = true
  end,
  capabilities = capabilities,
  settings = {
    vetur = {
      completion = {
        autoImport = true,
        useScaffoldSnippets = true
      },
      format = {
        defaultFormatter = {
          html = "prettier",
          js = "prettier",
          ts = "prettier",
        }
      },
      validation = {
        template = true,
        script = true,
        style = true,
        templateProps = true,
        interpolation = true
      },
      experimental = {
        templateInterpolationService = true
      }
    }
  },
  root_dir = util.root_pattern("header.php", "package.json", "style.css", 'webpack.config.js')
}

-- EFM Lang server

-- Languages setup
local languages = {
  --typescript = { prettier, eslint },
  --javascript = { prettier, eslint },
  vue = { prettier, eslint },
  yaml = { yamllint },
  --lua = { luafmt },
  html = { prettier },
  scss = { prettier },
  css = { prettier },
  sh = { shell },
  zsh = { shell },
}

lspconfig.efm.setup({
  root_dir = lspconfig.util.root_pattern(".git", "/home/canus/Scripts", vim.loop.os_homedir()),
  filetypes = vim.tbl_keys(languages),
  cmd = {
    vim.loop.os_homedir() .. "/go/bin/efm-langserver",
    "-logfile",
    vim.loop.os_homedir() .. "/.cache/nvim/lsp.log",
    "-loglevel",
    "5",
  },
  init_options = { documentFormatting = true, codeAction = true },
  settings = {
    languages = languages,
    log_level = 1,
    log_file = vim.loop.os_homedir() .. ".cache/nvim/lsp.log",
  },
})
