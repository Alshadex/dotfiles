-- find themes at: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

require('lualine').setup {
    options = {
        theme = 'onedark'
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {'filename', path = 1 }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'diff' }
    },
}

