local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "go",
        "gomod",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "proto",
        "python",
        "regex",
        "sql",
        "toml",
        "typescript",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
        use_languagetree = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
}
-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

treesitter.setup(options)

-- 其他扩展模块
-- https://hub.fastgit.xyz/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
