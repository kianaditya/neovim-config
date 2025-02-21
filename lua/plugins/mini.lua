return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- Add configuration for mini.nvim submodules here
			require("mini.files").setup({
				-- Your mini.files configuration
			})
			require("mini.surround").setup({
				-- Your mini.surround configuration
			})
			require("mini.ai").setup({ n_lines = 500 })
			-- require("mini.starter").setup({
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
			-- Your mini.files configuration
			-- })
			-- Add more submodules as needed
			-- require("mini.terminal").setup({})
		end,
	},
}
