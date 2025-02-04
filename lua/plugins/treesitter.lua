local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.bruno = {
    install_info = {
        url = "https://github.com/Scalamando/tree-sitter-bruno",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "main"
    },
    filetype = "bruno"
}

vim.filetype.add({
    extension = {
        bru = "bruno"
    }
})

vim.treesitter.language.register('bruno', {'bruno'})

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {"BufReadPre", "BufNewFile"},
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true
    },
    matchup = {
        enable = true
    },
    opts = {
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        },
        ensure_installed = {"bash", "bruno", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap",
                            "markdown", "markdown_inline", "printf", "python", "query", "regex", "sql", "toml", "tsx",
                            "typescript", "vim", "vimdoc", "xml", "yaml"},
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>"
            }
        }
    }
}
