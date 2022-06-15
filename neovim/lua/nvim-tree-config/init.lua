require'nvim-tree'.setup {
	open_on_setup = true,
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		root_folder_modifier = ":~",
		indent_markers = {
            enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
}

vim.keymap.set('n', '<F6>', ':NvimTreeToggle<cr>')


-- Temporary function for nvim tree auto close.
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})
