-- 自动命令，好像有版本要求
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api


autocmd("BufUnload", {
    buffer = 0,
    callback = function()
        vim.opt.laststatus = 3
    end,
})

autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.opt.laststatus = 0
    end,
})

autocmd("FileType", {
    pattern = "qf",
    callback = function(args)
        api.nvim_buf_set_keymap(args.buf, "n", "q", "<cmd>bdelete<CR>", { noremap = true, silent = true })
    end,
})

-- 移除缓冲区
autocmd("BufUnload", {
    buffer = 0,
    callback = function()
        vim.opt.laststatus = 3
    end,
})
