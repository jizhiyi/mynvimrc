-- leader key 为,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local maps = {}

maps.Edit = {
    keyprefix = "<leader>e",
    map_item = {
        i = {
            -- 插入模式，替换方向键
            ["<C-h>"] = { "<Left>", " move left" },
            ["<C-l>"] = { "<Right>", " move right" },
            ["<C-j>"] = { "<Down>", " move down" },
            ["<C-k>"] = { "<Up>", " move up" },
            ["jk"] = { "<ESC>", " Esc" }
        },
        n = {
            -- 分屏移动
            ["<C-h>"] = { "<C-w>h", " window left" },
            ["<C-l>"] = { "<C-w>l", " window right" },
            ["<C-j>"] = { "<C-w>j", " window down" },
            ["<C-k>"] = { "<C-w>k", " window up" },
            -- line numbers
            ["<leader>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
            ["<leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },
        },
        t = {
            ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
        },
    }
}

maps.FilexFind = {
    keyprefix = "<leader>f",
    map_item = {
        n = {
            -- toggle
            ["<leader>ft"] = { "<cmd> NvimTreeToggle <CR>", "פּ   toggle nvimtree" },
            -- find
            ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
            ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
            ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
            ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
            ["<leader>fm"] = { "<cmd> Telescope <CR>", "  find builtin" },
            ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
            ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
        },
    }
}

maps.Git = {
    keyprefix = "<leader>g",
    map_item = {
        n = {
            -- git
            ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
            ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },
        },
    }
}

maps.Buff = {
    keyprefix = "<leader>b",
    map_item = {
        n = {
            ["<leader>bn"] = { "<cmd>BufferLineCycleNext<CR>", "  goto next buffer" },
            ["<leader>bp"] = { "<cmd>BufferLineCyclePrev<CR>", "  goto prev buffer" },
            ["<leader>bc"] = { "<cmd>Bdelete!<CR>", "   close buffer" },
            ["<C-x>"] = { "<cmd>Bdelete!<CR>", "   close buffer" },
        },
    }
}

maps.Others = {
    keyprefix = "<leader>o",
    map_item = {
        n = {
            ["<leader>oc"] = { "<cmd> Telescope colorscheme <CR>", "  change colorscheme" },
        },
    }
}


maps.Helps = {
    keyprefix = "<leader>h",
    map_item = {
        n = {
            ["<leader>hk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
        },
    }
}

local M = {}
M.load_mappings = function(mappings, mapping_opt)
    local ok, wk = pcall(require, "which-key")
    if not ok then
        return
    end
    local registerwhichkey = function(keybind, mapping_info, opts)
        wk.register({ [keybind] = mapping_info }, opts)
    end
    for groupname, group_mappings in pairs(mappings) do
        if group_mappings.keyprefix ~= nil then
            registerwhichkey(group_mappings.keyprefix, "" .. groupname)
            -- registerwhichkey(group_mappings.keyprefix, groupname)
        end
        if group_mappings.map_item ~= nil then
            for mode, mode_mappings in pairs(group_mappings.map_item) do
                for bindkey, bindkeyinfo in pairs(mode_mappings) do
                    local opts = vim.tbl_deep_extend("force", { mode = mode }, mapping_opt or {})
                    registerwhichkey(bindkey, bindkeyinfo, opts)
                end
            end
        end
    end
end


vim.defer_fn(function()
    M.load_mappings(maps)
end, 0)

return M
