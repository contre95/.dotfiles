return {
    "hedengran/fga.nvim",
    dependencies = {
        "neovim/nvim-lspconfig", -- Optional, for LSP integration
        "nvim-treesitter/nvim-treesitter", -- Optional, for enhanced syntax highlighting
    },
    config = function()
        require("fga").setup({
            install_treesitter_grammar = true,
            -- lsp_server = "/path/to/vscode-ext/server/out/server.node.js",
        })
    end,
}
