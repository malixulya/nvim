require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
		component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
vim.cmd("syntax on")
vim.cmd("set termguicolors")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("colorscheme mountain")
vim.opt.clipboard:append("unnamedplus")
local builtin = require('telescope.builtin')
require('mini.indentscope').setup {

  -- Which character to use for drawing scope indicator
  symbol = '',
}

vim.keymap.set('n', '<C-f>', function()
  require('telescope.builtin').find_files({
	layout_config={
		width=80,
		height=40
	},
	previewer=false
  })
end, { desc = 'Telescope find files in ./' })
vim.keymap.set('n', '<C-s>', function()
  require('telescope.builtin').find_files({
    cwd = 'src',
	layout_config = 
	{
		width = 80,
		height = 40,
	},
	previewer=false,
  })
end, { desc = 'Telescope find files in src/' })
vim.keymap.set('n', '<leader>cd', function()
  vim.cmd('!make debug')
end, { desc = 'Configure & Build Debug' })
vim.keymap.set('n', '<leader>cr', function()
  vim.cmd('!make all')
end, { desc = 'Configure & Build Release' })
vim.keymap.set('n', '<leader>rd', function() 
	vim.cmd('!./RunDebug.sh')
end, { desc = 'Run first Debug executable' })
vim.keymap.set('n', '<leader>rr', function()
  vim.cmd('!./RunRelease.sh')
end, { desc = 'Run first Release executable' })
vim.keymap.set('n', '<leader>dd', function()
  vim.cmd('!./Debug.sh')
end, { desc = 'Debug first Debug executable' })
vim.keymap.set('n', '<leader>s', function()
  require('telescope.builtin').lsp_document_symbols({
	layout_config = 
	{
		width = 80,
		height = 40,
	},
	previewer=false,
  })
end, { desc = 'LSP SYMBOLS' })

