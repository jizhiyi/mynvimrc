local util = require("lspconfig/util")

-- local function OrgImports(wait_ms)
-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = { only = { "source.organizeImports" } }
-- 	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
-- 	for _, res in pairs(result or {}) do
-- 		for _, r in pairs(res.result or {}) do
-- 			if r.edit then
-- 				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
-- 			else
-- 				vim.lsp.buf.execute_command(r.command)
-- 			end
-- 		end
-- 	end
-- end

local opts = {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		require("lsp.mappings")({ buffer = bufnr })
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*.go",
		-- 	callback = function()
		-- 		print("BufWritePre")
		-- 		OrgImports(1000)
		-- 	end,
		-- })
	end,
}

local M = {}

M.on_setup = function(server)
	-- opts = require("lua-dev").setup({ lspconfig = opts })
	server.setup(opts)
end

return M
