require'nvim-tree'.setup {
    auto_reload_on_write = true,
    sort_by = 'name',
	open_on_setup = true,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = 'yes'
    },
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		root_folder_modifier = ':~',
		indent_markers = {
            enable = true,
			icons = {
				corner = '└ ',
				edge = '│ ',
				none = '  ',
			},
		},
	},
}

