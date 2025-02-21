return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},
	{
		"echasnovski/mini.icons",
		opts = {
			file = {
				[".go-version"] = { glyph = "?", hl = "MiniIconsBlue" },
			},
			filetype = {
				gotmpl = { glyph = "??", hl = "MiniIconsGrey" },
			},
		},
	},
}
