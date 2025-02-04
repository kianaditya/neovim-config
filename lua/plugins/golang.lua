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
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").gopls.setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "go" },
				highlight = { enable = true },
			})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},
	{
		"fredrikaverpil/neotest-golang",
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
