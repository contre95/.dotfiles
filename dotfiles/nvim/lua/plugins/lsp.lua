require("mason").setup() -- Install LSP, DAP servers, linters, and formatters
local lspconfig = require("lspconfig")
local util = require 'lspconfig.util'
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

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

-- Languages Configuration
-----------------------------

--Json
lspconfig.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- Yamls
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
          "/azure-pipeline*.y*l",
          "/*.azure*",
          "Azure-Pipelines/**/*.y*l",
          "Pipelines/*.y*l",
        },
      },
    },
  },
})
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

-- require 'lspconfig'.vale.setup {}
-- Latex
require 'lspconfig'.vale_ls.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(".git"),
  filetypes = { "tex", "md", "txt" },

}
-- Markdown
require 'lspconfig'.marksman.setup {}
-- C

lspconfig.ccls.setup({
  capabilities = capabilities,
  filetypes = { "c" },
})

-- Rust
lspconfig.rust_analyzer.setup({
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
-- lspconfig.black.setup({ capabilities = capabilities, handlers = handlers })

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
  filetypes = { "tf", "terraform", "tfvars" },
})

-- SQL  -- go install github.com/lighttiger2505/sqls@latest
lspconfig.sqlls.setup({
  cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
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
lspconfig.tsserver.setup({ capabilities = capabilities })
-- HTML
lspconfig.html.setup { capabilities = capabilities, }

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

-- EFM Lang server
-- Linters, Prettiers and Checkers for EFM
-----------------------------
local sqlfmt = { formatCommand = "cat ${INPUT} | sqlfmt -" }
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
local yamlfmt = {
  --lintCommand = "yamllint --format parsable ${INPUT}",
  formatCommand = "cat ${INPUT} | yamlfmt -in",
  lintStdin = true,
}

-- Latex Formatter
local latexindent = {
  formatCommand = "latexindent",
  lintStdin = true,
}

-- Shell Formatter / Checker
local pep8 = {
  formatCommand = "autopep8",
}
local nixpkgs = {
  formatCommand = "nixpkgs-fmt %",
}

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
-- Vale linter
-- Languages setup
local languages = {
  typescript = { prettier, eslint },
  javascript = { prettier, eslint },
  vue = { prettier, eslint },
  yaml = { yamlfmt },
  --lua = { luafmt },
  -- html = { prettier },
  scss = { prettier },
  sql = { sqlfmt },
  tex = { latexindent },
  -- nix = { nixpkgs },
  css = { prettier },
  sh = { shell },
  zsh = { shell },
  python = { pep8 },
}

-- local lsp_path = vim.env.NIL_PATH or 'target/debug/nil'
lspconfig.nil_ls.setup {
  autostart = true,
  capabilities = capabilities,
  cmd = { 'nil' },
  settings = {
    ['nil'] = {
      testSetting = 42,
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  }
}

lspconfig.efm.setup({
  root_dir = lspconfig.util.root_pattern(".git", "/home/canus/Scripts", vim.loop.os_homedir()),
  filetypes = vim.tbl_keys(languages),
  -- cmd = {
  --   vim.loop.os_homedir() .. "/go/bin/efm-langserver",
  --   "-logfile",
  --   vim.loop.os_homedir() .. "/.cache/nvim/lsp.log",
  --   "-loglevel",
  --   "5",
  -- },
  init_options = { documentFormatting = true, codeAction = true },
  settings = {
    languages = languages,
    log_level = 1,
    log_file = vim.loop.os_homedir() .. ".cache/nvim/lsp.log",
  },
})
