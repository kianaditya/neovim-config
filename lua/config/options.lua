vim.cmd("language en_US")
vim.env.TERM = "xterm-ghostty"

vim.lsp.set_log_level("debug")

local opt = vim.opt
-- Set line numbers
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- Set indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Enable mouse support
opt.mouse = "a"

-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

opt.termguicolors = true

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx" },
	callback = function()
		vim.lsp.buf.execute_command({
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		})
	end,
})
