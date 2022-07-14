vim.cmd "packadd packer.nvim"

local plugins = {
    -- 颜色主题
    ["folke/tokyonight.nvim"] = {},
    ["mhartington/oceanic-next"] = {},
    ["ellisonleao/gruvbox.nvim"] = {},
    ["shaunsingh/nord.nvim"] = {},
    ["ful1e5/onedark.nvim"] = {},
    ["EdenEast/nightfox.nvim"] = {},
    ["sainnhe/sonokai"] = {},
    ["folke/which-key.nvim"] = {
        module = "which-key",
        config = function()
            require "plugins.config.whichkey"
        end,
    },
    ["kyazdani42/nvim-web-devicons"] = {
        module = "nvim-web-devicons",
        config = function()
            require("plugins.config.others").devicons()
        end,
    },
    ["kyazdani42/nvim-tree.lua"] = {
        ft = "alpha",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.config.nvimtree"
        end,
    },
    ["nvim-lua/plenary.nvim"] = { module = "plenary" },
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        config = function()
            require "plugins.config.telescope"
        end,
    },
    -- 代码高亮
    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function()
            require("core.lazy_load").on_file_open "nvim-treesitter"
        end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function()
            require "plugins.config.treesitter"
        end,
    },
    ["p00f/nvim-ts-rainbow"] = {},
    ["NvChad/nvim-colorizer.lua"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").colorizer()
        end,
        config = function()
            require("plugins.config.others").colorizer()
        end,
    },
    -- 顶栏
    ["moll/vim-bbye"] = {},
    ["akinsho/bufferline.nvim"] = {
        module = "bufferline",
        setup = function()
            require("core.lazy_load").on_file_open "bufferline.nvim"
        end,
        requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
        config = function()
            require("plugins.config.others").bufferline()
        end,
    },
    -- 底部信息
    ["nvim-lualine/lualine.nvim"] = {
        module = "lualine",
        setup = function()
            require("core.lazy_load").on_file_open "lualine.nvim"
        end,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.config.lualine").lualine()
        end
    },
    ["arkav/lualine-lsp-progress"] = {
        opt = true,
        after = "lualine.nvim",
        module = "lualine-lsp-progress",
    },
    -- 欢迎界面
    ["goolord/alpha-nvim"] = {
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.config.alpha")
        end
    },
    -- 提示线
    ["lukas-reineke/indent-blankline.nvim"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require("plugins.config.others").blankline()
        end,
    },
    -- LSP
    ["williamboman/nvim-lsp-installer"] = {
        cmd = require("core.lazy_load").lsp_cmds,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lsp-installer"
        end,
    },

    ["neovim/nvim-lspconfig"] = {
        after = "nvim-lsp-installer",
        module = "lspconfig",
        config = function()
            require ("plugins.config.others").lspInstall()
            require ("lsp.setup")
            require ("ui.lsp")
        end,
    },
    -- cmp
    ["rafamadriz/friendly-snippets"] = {
        event = {"InsertEnter", "CmdlineChanged"}
    },
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        config = function()
            require "plugins.config.cmp"
        end,
    },
    ["hrsh7th/vim-vsnip"] = {
        after = "nvim-cmp"
    },
    ["hrsh7th/cmp-vsnip"] = {
        after = "nvim-cmp"
    },
    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "nvim-cmp"
    },
    ["hrsh7th/cmp-buffer"] = {
        after = "nvim-cmp"
    },
    ["hrsh7th/cmp-path"] = {
        after = "nvim-cmp"
    },
    ["hrsh7th/cmp-cmdline"] = {
        after = "nvim-cmp"
    },
    -- git
    ["lewis6991/gitsigns.nvim"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").gitsigns()
        end,
        config = function()
            require("plugins.config.others").gitsigns()
        end,
    },
}
-- 处理成需要的结构
local final_plugins = {}
for key, _ in pairs(plugins) do
    plugins[key][1] = key
    final_plugins[#final_plugins + 1] = plugins[key]
end

require("core.packer").run(final_plugins)
