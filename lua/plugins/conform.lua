return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		log_level = vim.log.levels.DEBUG,
		default_format_opts = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
			lsp_format = "fallback", -- not recommended to change
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			sql = { "sql_formatter" },
			go = { "gofmt", "goimports" },
			-- Add more formatters for other filetypes as needed
		},
		vim.keymap.set({ "n", "v" }, "<leader>mp", function() end, { desc = "Format file or range (in visual mode)" }),
	},
}
