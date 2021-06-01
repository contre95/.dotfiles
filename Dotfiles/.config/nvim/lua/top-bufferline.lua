-- define some colors

local bar_fg = "#565c64"
local activeBuffer_fg = "#c8ccd4"

require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        indicator_icon = '▎',
        modified_icon = " ",
        close_icon = " ",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators =  true,
        enforce_regular_tabs = true,
        show_close_icon = true,
        --view = "multiwindow",
        show_buffer_close_icons = true,
        sort_by =  "extension",
        separator_style =  "slant",
        mappings = "true"
    },
    -- bar colors!!
    highlights = {
        fill = {
            guifg = bar_fg,
            guibg = "#363636"
        },
        background = {
            guifg = bar_fg,
            guibg = "#262625"
        },
        -- buffer
        buffer_selected = {
            guifg = activeBuffer_fg,
            guibg = "#181818",
            gui = "bold"
        },
        buffer_visible = {
            guifg = "#9298a0",
            guibg = "#181818"
        },
        -- tabs over right
        tab = {
            guifg = "#9298a0",
            guibg = "#30343c"
        },
        tab_selected = {
            guifg = "#30343c",
            guibg = "#9298a0"
        },
        tab_close = {
            guifg = "#f9929b",
            guibg = "#252931"
        },
        -- buffer separators
        separator = {
            guifg = "#363636",
            guibg = "#363636"
        },
        separator_selected = {
            guifg = "#363636",
            guibg = "#363636"
        },
        separator_visible = {
            guifg = "#363636",
            guibg = "#363636"
        },
        indicator_selected = {
            guifg = "#363636",
            guibg = "#363636"
        },
        -- modified files (but not saved)

        modified_visible = {
            guifg = "#BF616A",
            guibg= "#252931"
        },
        modified = {
            guifg = "#BF616A",
            guibg= "#252931"
        }
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- MAPPINGS
--map("n", "<C-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
--map("n", "<C-w>", [[<Cmd>bdelete<CR>]], opt) -- close tab
