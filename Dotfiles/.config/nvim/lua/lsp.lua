local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

-- Lua linter -- cargo install stylua
local luafmt = {
	formatCommand = "stylua -s --stdin-filepath ${INPUT} -",
	formatStdin = true,
}

-- Shell Formatter / Checker 
local shell =  {
   formatCommand = "shfmt ${-i:tabWidth}",
  lintCommand = "shellcheck -f gcc -x -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"}
}

-- Rust Formatter
local rustfmt = {
	formatCommand = "rustfmt",
	formatStdin = true,
}

-- LSP Configuration
-----------------------------

-- Json
lspconfig.jsonls.setup({ capabilities = capabilities })

-- Rust
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

-- Golang
lspconfig.gopls.setup({ capabilities = capabilities })

-- Terraform
lspconfig.tflint.setup({
lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
	cmd = { "terraform-ls", "serve" },
	filetypes = { "tf" },
})

-- SQL  -- go install github.com/lighttiger2505/sqls@latest
lspconfig.sqls.setup({ capabilities = capabilities })

-- Typescript
lspconfig.tsserver.setup({ capabilities = capabilities })

-- General purpose LS
-- Languages setup
local languages = {
	typescript = { prettier, eslint },
	javascript = { prettier, eslint },
	yaml = { prettier },
	lua = { luafmt },
	json = { prettier },
	html = { prettier },
	scss = { prettier },
	css = { prettier },
	markdown = { prettier },
	sh = { shell },
	zsh = { shell },
	--rust = { rustfmt },
	-- python = {autopep}
}

lspconfig.efm.setup({
	root_dir = lspconfig.util.root_pattern(".git", "/home/canus/Scripts", "/home/contre"),
	filetypes = vim.tbl_keys(languages),
	cmd = {
		"/home/contre/go/bin/efm-langserver",
		"-logfile",
		"/home/contre/.cache/nvim/lsp.log",
		"-loglevel",
		"5",
	},
	init_options = { documentFormatting = true, codeAction = true },
	filetypes = {
		"css",
		"html",
		"rust",
		"javascript",
		"bash",
		"sh",
		"yaml",
		"zsh",
		"json",
		"lua",
		"markdown",
		"python",
	},
	settings = {
		languages = languages,
		log_level = 1,
		log_file = "/home/contre/.cache/nvim/lsp.log",
	},

	-- on_attach = on_attach
})
