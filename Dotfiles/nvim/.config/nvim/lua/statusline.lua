require('lualine').setup {
    options = {theme = 'material-nvim'},
    sections = {
        lualine_a = {{'mode', fmt = function(str) return str:sub(1, 1) end}},
        lualine_b = {'branch'}
    },
    lualine_c = {require('lsp-status').status}
}

