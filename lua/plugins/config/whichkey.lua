local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

local options = {
    popup_mappings = {
        scroll_down = '<c-j>', -- binding to scroll down inside the popup
        scroll_up = '<c-k>', -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        spacing = 6, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
}

wk.setup(options)
