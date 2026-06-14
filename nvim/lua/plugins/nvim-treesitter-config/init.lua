require('nvim-treesitter').setup({
    ensure_installed = {
        'c', 'cpp', 'make',
        'go', 'gomod', 'gowork',
        'javascript', 'typescript',
        'dockerfile',
        'bash',
        'python',
        'vim',
        'solidity',
        'lua',
        'html', 'css',
        'hcl',
    },
})
