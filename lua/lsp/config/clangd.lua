local opts = {
    cmd = { "clangd", "--limit-references=0", "--background-index"},
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        require("lsp.mappings")({ buffer = bufnr})
    end,
}



local M = {}

M.on_setup = function(server)
    -- opts = require("lua-dev").setup({ lspconfig = opts })
    server.setup(opts)
end

return M
