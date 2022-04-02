local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
lsp_status.register_progress()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = " ",
		spacing = 0,
	},
	signs = true,
	--update_in_insert = true,
})
-- Diagnosticis Signs
local signs = { Error = "❌", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Linters and Prettiers
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

-- Yaml linter -- cargo install stylua
local yamllint = {
	lintCommand = "yamllint --format parsable ${INPUT}",
    formatCommand = "prettier --parser yaml ${INPUT}",
	lintStdin = true,
}

-- Lua linter -- cargo install stylua
local luafmt = {
	formatCommand = "stylua -s --stdin-filepath ${INPUT} -",
	formatStdin = true,
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

-- Json
lspconfig.jsonls.setup({ capabilities = capabilities })

-- Rust
require("lsp_extensions").inlay_hints()
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	filetypes = { "rs", "rust" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

-- Golang
lspconfig.gopls.setup({ capabilities = capabilities })

-- Terraform
lspconfig.tflint.setup({})
lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
	end,
	cmd = { "terraform-ls", "serve" },
	filetypes = { "tf", "terraform" },
})

-- SQL  -- go install github.com/lighttiger2505/sqls@latest
lspconfig.sqls.setup({
	-- cmd = { "/path/to/sqls", "-config", "$HOME/.config/sqls/config.yml" },
	capabilities = capabilities,
	picker = "telescope",
})

-- Typescript
lspconfig.tsserver.setup({ capabilities = capabilities })

-- EFM Lang server

-- Languages setup
local languages = {
	typescript = { prettier, eslint },
	javascript = { prettier, eslint },
	yaml = { yamllint },
	lua = { luafmt },
	html = { prettier },
	scss = { prettier },
	css = { prettier },
	markdown = { prettier },
	sh = { shell },
	zsh = { shell },
}

lspconfig.efm.setup({
	root_dir = lspconfig.util.root_pattern(".git", "/home/canus/Scripts", "/home/contre"),
	filetypes = vim.tbl_keys(languages),
	cmd = {
         vim.loop.os_homedir() .. "/go/bin/efm-langserver",
		"-logfile",
         vim.loop.os_homedir().."/.cache/nvim/lsp.log",
		"-loglevel",
		"5",
	},
	init_options = { documentFormatting = true, codeAction = true },
	filetypes = {
		"css",
		"html",
		"javascript",
		"bash",
		"yaml",
		"yml",
		"sh",
		"zsh",
		"lua",
		"markdown",
	},
	settings = {
		languages = languages,
		log_level = 1,
		log_file =  vim.loop.os_homedir()..".cache/nvim/lsp.log",
	},
})
