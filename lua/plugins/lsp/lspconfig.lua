return {
	"neovim/nvim-lspconfig",
	event = "LazyFile",
	dependencies = {
		"mason.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			config = function() end,
		},
	},
	opts = function()
		local ret = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
						[vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
						[vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
						[vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
					},
				},
			},

			inlay_hints = {
				enabled = true,
				exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
			},
			-- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
			-- Be aware that you also will need to properly configure your LSP server to
			-- provide the code lenses.
			codelens = {
				enabled = true,
			},
			-- add any global capabilities here
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},

			servers = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
				tsserver = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					keys = {
						{ "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", desc = "Organize Imports" },
						{ "<leader>cs", "<cmd>TSToolsSortImports<CR>", desc = "Sort Imports" },
						{ "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>", desc = "Remove Unused Imports" },
						{ "<leader>cU", "<cmd>TSToolsRemoveUnused<CR>", desc = "Remove Unused Statements" },
						{ "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>", desc = "Add Missing Imports" },
						{ "<leader>cf", "<cmd>TSToolsFixAll<CR>", desc = "Fix All" },
						{ "gD", "<cmd>TSToolsGoToSourceDefinition<CR>", desc = "Go to Source Definition" },
						{ "<leader>cR", "<cmd>TSToolsRenameFile<CR>", desc = "Rename File" },
						{ "gR", "<cmd>TSToolsFileReferences<CR>", desc = "File References" },
					},
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				eslint = {
					settings = {
						packageManager = "npm",
					},
				},
			},
			setup = {
				gopls = function(_, opts)
					-- workaround for gopls not supporting semanticTokensProvider
					-- https://github.com/golang/go/issues/54531#issuecomment-1464982242
					LazyVim.lsp.on_attach(function(client, _)
						if not client.server_capabilities.semanticTokensProvider then
							local semantic = client.config.capabilities.textDocument.semanticTokens
							client.server_capabilities.semanticTokensProvider = {
								full = true,
								legend = {
									tokenTypes = semantic.tokenTypes,
									tokenModifiers = semantic.tokenModifiers,
								},
								range = true,
							}
						end
					end, "gopls")
					-- end workaround
				end,
				typescript = function(_, opts)
					require("typescript").setup({
						server = vim.tbl_extend("force", opts, {
							filetypes = {
								"typescript",
								"javascript",
								"typescriptreact",
								"javascriptreact",
								"typescript.tsx",
								"javascript.jsx",
							},
						}),
					})
					return true
				end,
			},
		}
		return ret
	end,
}
