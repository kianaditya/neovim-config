return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			},
		},
	},
	{
		"nvim-lspconfig",
		config = function()
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})
		end,
	},
}
