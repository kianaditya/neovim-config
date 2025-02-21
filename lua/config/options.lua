vim.cmd("language en_US")
vim.env.TERM = "xterm-ghostty"

vim.lsp.set_log_level("debug")

local opt = vim.opt

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Set indentation
opt.expandtab = true

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx" },
	callback = function()
		vim.lsp.buf.execute_command({
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		})
	end,
})
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
