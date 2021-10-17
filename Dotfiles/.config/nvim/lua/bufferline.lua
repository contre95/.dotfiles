-- define some colors

local bar_fg = "#565c64"
local activeBuffer_fg = "#c8ccd4"

require "bufferline".setup {
    options = {
       offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left"
          }
        },
        buffer_close_icon = " ",
        indicator_icon = '▎',
        numbers= "none",
        modified_icon = " ",
        close_icon = " ",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        diagnostics = false,
        show_tab_indicators =  true,
        enforce_regular_tabs = true,
        show_close_icon =false,
        --view = "multiwindow",
        show_buffer_close_icons = true,
        sort_by =  "directory",
        separator_style =   { 'any', 'any' },
    },
    -- bar colors!!
    highlights = {
        fill = {
            guifg = bar_fg,
            guibg = "#363636"
        },
        background = {
            guifg = bar_fg,
            guibg = "#252931"
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
            guibg = "#80ABAB"
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
            guibg = "#252931"
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

-- MAPPINGS
--map("n", "<C-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
--map("n", "<C-w>", [[<Cmd>bdelete<CR>]], opt) -- close tab
