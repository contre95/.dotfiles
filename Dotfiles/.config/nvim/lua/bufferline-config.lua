--local bar_fg = "#565c64"
--local activeBuffer_fg = "#c8ccd4"

require "bufferline".setup {
    options = {
       offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return " Neovim"
            end,
            --highlight =  {gui = "undercurl", guisp = "green"},
            text_align = "center"
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
        separator_style =   { '   ', '   '},
    },
    -- bar colors!!
    highlights = {
        background = {
            guibg = "#1B1B1B"
        },
        tab_selected = {
            guifg = "#FFFFF0"
        },
        separator = {
            guifg = "#363636"
        },
        separator_visible = {
            guifg = "#363636",
            guibg = "#252931"
        },
    }
}

-- MAPPINGS
--map("n", "<C-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
--map("n", "<C-w>", [[<Cmd>bdelete<CR>]], opt) -- close tab
