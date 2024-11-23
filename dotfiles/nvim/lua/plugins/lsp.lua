-- Mappings
vim.keymap.set("n", "<leader>d", ":vs|:Def<cr>")
-- Commands
vim.api.nvim_create_user_command("Info", function()
	return vim.lsp.buf.hover()
end, {})
vim.api.nvim_create_user_command("Rename", function()
	return vim.lsp.buf.rename()
end, {})
vim.api.nvim_create_user_command("Def", function()
	return vim.lsp.buf.definition()
end, {})
vim.api.nvim_create_user_command("Ref", function()
	return vim.lsp.buf.references()
end, {})
vim.api.nvim_create_user_command("DapOpen", function()
	return require("dapui").open()
end, {})
vim.api.nvim_create_user_command("DapClose", function()
	return require("dapui").close()
end, {})
vim.api.nvim_create_user_command("DList", function()
	return vim.diagnostic.setqflist()
end, {})
vim.api.nvim_create_user_command("Imp", function()
	return vim.lsp.buf.implementation()
end, {})
vim.api.nvim_create_user_command("CodeAction", function()
	return vim.lsp.buf.code_action()
end, {})
vim.api.nvim_create_user_command("Diagnose", function()
	return vim.diagnostic.open_float()
end, {})
vim.api.nvim_create_user_command("RemoveBlankLines", function()
	return vim.cmd(":g/^\\s*$/d")
end, {})
vim.api.nvim_create_user_command("Fmt", function()
	return vim.lsp.buf.format({ async = true })
end, {})
vim.api.nvim_create_user_command("SignatureHelp", function()
	return vim.lsp.buf.signature_help()
end, {})
vim.api.nvim_create_user_command("LspLog", function()
	return vim.cmd("sp" .. vim.lsp.get_log_path())
end, {})

-- Set rounded borders for LSP handlers
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Apply the handlers
for name, handler in pairs(handlers) do
	vim.lsp.handlers[name] = handler
end

vim.diagnostic.config({
	float = {
		border = "rounded",
	},
})

-- Define capabilities with cmp_nvim_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Plugin configuration
return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")

			-- TSServer setup
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize imports",
					},
				},
			})

			-- Pyright setup
			lspconfig.pyright.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "python" },
			})
			-- Terraform setup
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

			-- BashLS setup
			lspconfig.bashls.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "shell", "bash", "zsh", "sh" },
			})

			-- Gopls setup
			lspconfig.gopls.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				cmd = { "gopls" },
				root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			-- DockerLS setup
			lspconfig.dockerls.setup({
				capabilities = capabilities,
				handlers = handlers,
				cmd = { "docker-langserver", "--stdio" },
				filetypes = { "dockerfile" },
				root_dir = require("lspconfig/util").root_pattern("Dockerfile"),
				single_file_support = true,
			})

			-- Docker Compose Language Service setup
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
				handlers = handlers,
				cmd = { "docker-compose-langserver", "--stdio" },
				filetypes = { "yaml.docker-compose" },
				root_dir = require("lspconfig/util").root_pattern(
					"docker-compose.yaml",
					"docker-compose.yml",
					"compose.yaml",
					"compose.yml"
				),
				single_file_support = true,
			})

			-- json
			lspconfig.jsonls.setup({
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
						end,
					},
				},
			})

			-- yaml
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					yaml = {
						schemas = {
							kubernetes = "k8s-*.yaml",
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
							["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
							["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
							-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
							["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
						},
					},
				},
			})

			-- SQL Language Server setup
			lspconfig.sqlls.setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = { "sql", "pgsql", "mysql" },
				-- root_dir = function(_)
				--   return vim.loop.cwd()
				-- end,
			})

			-- HTML setup
			lspconfig.html.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			-- HTMX setup
			lspconfig.htmx.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			-- CSS Language Server setup
			lspconfig.cssls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			-- CCLS setup
			lspconfig.ccls.setup({
				capabilities = capabilities,
				handlers = handlers,
				init_options = {
					compilationDatabaseDirectory = "build",
					index = {
						threads = 0,
					},
					clang = {
						excludeArgs = { "-frounding-math" },
					},
				},
			})

			-- nil
			lspconfig.nil_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "different-requires" },
						},
					},
				},
			})
		end,
	},
}
