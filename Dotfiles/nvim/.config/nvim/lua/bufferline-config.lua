-- local bar_fg = "#565c64"
-- local activeBuffer_fg = "#c8ccd4"
local is_visible = require"bufferline".setup {
    options = {
        custom_filter = function(bufnr)
            for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
                for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
                    local winbufnr = vim.api.nvim_win_get_buf(winid)
                    local winvalid = vim.api.nvim_win_is_valid(winid)
                    if winvalid and winbufnr == bufnr then
                        return true
                    end
                end
            end
            return false
       end,
        offsets = {
            {
                filetype = "NvimTree",
                text = function() return " Neovim" end,
                -- highlight =  {gui = "undercurl", guisp = "green"},
                text_align = "center"
            }
        },
        buffer_close_icon = " ",
        indicator =  {
          style = '▎',
        },
        numbers = "none",
        modified_icon = " ",
        close_icon = " ",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        diagnostics = false,
        show_tab_indicators = false,
        enforce_regular_tabs = true,
        show_close_icon = false,
        -- view = "multiwindow",
        show_buffer_close_icons = true,
        sort_by = "directory",
        separator_style = {'---', '---'},
    },
}

-- MAPPINGS
-- map("n", "<C-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
-- map("n", "<C-w>", [[<Cmd>bdelete<CR>]], opt) -- close tabm
