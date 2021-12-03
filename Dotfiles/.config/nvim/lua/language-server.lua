require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.terraformls.setup{} 
require'lspconfig'.sqls.setup{}
require'lspconfig'.tsserver.setup{}

-- go install github.com/mattn/efm-langserver@latest
require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            }
        }
    }
}
