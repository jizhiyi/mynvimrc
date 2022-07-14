local M = {}

M.lualine = function()
    local ok, colorizer = pcall(require, "lualine")
    if not ok then
        return
    end

    local options = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '|', right = '|'},
            section_separators = {
                left = " ",
                right = "",
            },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_c = {
                "filename",
                {
                    "lsp_progress",
                    spinner_symbols = { " ", " ", " ", " ", " ", " " },
                },
            },
            lualine_x = {
                "filesize",
                {
                    "fileformat",
                    symbols = {
                        unix = '', -- e712
                        dos = '', -- e70f
                        mac = '', -- e711
                    },
                },
                "encoding",
                "filetype",
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    }
    colorizer.setup(options)
end

return M
