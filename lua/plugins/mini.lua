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
			-- require("mini.starter").setup({
			-- Your mini.files configuration
			-- })
			-- Add more submodules as needed
		end,
	},
}
