local maps = {}
maps.Lsp = {
    keyprefix = "<leader>l",
    map_item = {
        n = {
            ["<leader>lh"] = {
                function()
                    vim.lsp.buf.hover()
                end,
                "   lsp hover"
            },
            ["K"] = {
                function()
                    vim.lsp.buf.hover()
                end,
                "   lsp hover"
            },
            ["<leader>ls"] = {
                function()
                    vim.lsp.buf.signature_help()
                end,
                "   lsp signature_help",
            },
            ["<leader>lD"] = {
                function()
                    vim.lsp.buf.type_definition()
                end,
                "   lsp definition type",
            },
            ["<leader>lc"] = {
                function()
                    vim.lsp.buf.code_action()
                end,
                "   lsp code_action",
            },
            ["<leader>lf"] = {
                function()
                    vim.diagnostic.open_float()
                end,
                "   floating diagnostic",
            },
            ["<leader>lq"] = {
                function()
                    vim.diagnostic.setloclist()
                end,
                "   diagnostic setloclist",
            },

            ["<leader>lm"] = {
                function()
                    vim.lsp.buf.formatting()
                end,
                "   lsp formatting",
            },
        },
    }
}

maps.LspGoto = {
    keyprefix = "<leader>lg",
    map_item = {
        n = {
            ["<leader>lgd"] = {
                function()
                    vim.lsp.buf.definition()
                end,
                "   lsp definition",
            },
            ["gd"] = {
                function()
                    vim.lsp.buf.definition()
                end,
                "   lsp definition",
            },
            ["<leader>lgD"] = {
                function()
                    vim.lsp.buf.declaration()
                end,
                "   lsp declaration",
            },
            ["gD"] = {
                function()
                    vim.lsp.buf.declaration()
                end,
                "   lsp declaration",
            },
            ["<leader>lgr"] = {
                function()
                    vim.lsp.buf.references()
                end,
                "   lsp references",
            },
            ["gr"] = {
                function()
                    vim.lsp.buf.references()
                end,
                "   lsp references",
            },
        },
    },
}

maps.LspError = {
    keyprefix = "<leader>le",
    map_item = {
        n = {
            ["<leader>lep"] = {
                function()
                    vim.diagnostic.goto_prev()
                end,
                "   goto prev",
            },
            ["[d"] = {
                function()
                    vim.diagnostic.goto_prev()
                end,
                "   goto prev",
            },

            ["<leader>len"] = {
                function()
                    vim.diagnostic.goto_next()
                end,
                "   goto_next",
            },
            ["d]"] = {
                function()
                    vim.diagnostic.goto_next()
                end,
                "   goto_next",
            },
        }
    },
}

maps.LspProject = {
    keyprefix = "<leader>lp",
    map_item = {
        n = {
            ["<leader>lpa"] = {
                function()
                    vim.lsp.buf.add_workspace_folder()
                end,
                "   add workspace folder",
            },

            ["<leader>lpr"] = {
                function()
                    vim.lsp.buf.remove_workspace_folder()
                end,
                "   remove workspace folder",
            },

            ["<leader>lpl"] = {
                function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                "   list workspace folders",
            },
        },
    },
}

return function(opts)
    require("core.mappings").load_mappings(maps, opts)
end
