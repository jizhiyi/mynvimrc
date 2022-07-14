local M = {}

M.bufferline = function()
	local present, bufferline = pcall(require, "bufferline")

	if not present then
		return
	end

	local options = {
		-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		-- 没有？？
		offsets = {
			{
				filetype = "alpha",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	}

	bufferline.setup(options)
end

M.colorizer = function()
	local ok, colorizer = pcall(require, "colorizer")

	if not ok then
		return
	end

	local options = {
		filetypes = {
			"css",
			"javascript",
			"html",
		},
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- Set the display mode.
		},
	}

	colorizer.setup(options)

	vim.cmd("ColorizerAttachToBuffer")
end

M.devicons = function()
	local present, devicons = pcall(require, "nvim-web-devicons")

	if present then
		local options = { override = require("ui.icons").devicons }
		devicons.setup(options)
	end
end

M.blankline = function()
	local status, ident_blankline = pcall(require, "indent_blankline")
	if not status then
		return
	end
	local options = {
		indentLine_enabled = 1,
		buftype_exclude = { "terminal" },
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
		-- 空行占位
		space_char_blankline = " ",
		-- 用 treesitter 判断上下文
		show_current_context = true,
		show_current_context_start = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"element",
			"^if",
			"^while",
			"^for",
			"^object",
			"^table",
			"block",
			"arguments",
			"type",
		},
		-- :echo &filetype
		filetype_exclude = {
			"alpha",
			"dashboard",
			"packer",
			"terminal",
			"help",
			"log",
			"markdown",
			"TelescopePrompt",
			"lsp-installer",
			"lspinfo",
			"toggleterm",
		},
		-- 竖线样式
		-- char = '¦'
		-- char = '┆'
		-- char = '│'
		-- char = "⎸",
		char = "▏",
	}
	ident_blankline.setup(options)
end

M.lspInstall = function()
	local ok, lsp_installer = pcall(require, "nvim-lsp-installer")

	if not ok then
		return
	end

	local options = {
		-- ensure_installed is not needed as automatic_installation is enabled
		-- then any lsp server you setup by lspconfig is going to get installed automatically!

		-- ensure_installed = { "lua" },
		automatic_installation = true,

		ui = {
			icons = {
				server_installed = " ",
				server_pending = " ",
				server_uninstalled = " ﮊ",
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
			},
		},

		max_concurrent_installers = 10,
		github = {
			-- The template URL to use when downloading assets from GitHub.
			-- The placeholders are the following (in order):
			-- 1. The repository (e.g. "rust-lang/rust-analyzer")
			-- 2. The release version (e.g. "v0.3.0")
			-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
			download_url_template = "https://hub.fastgit.xyz//%s/releases/download/%s/%s",
		},
	}
	lsp_installer.setup(options)
end

M.gitsigns = function()
    local ok, gitsigns = pcall(require, "gitsigns")

    if not ok then
        return
    end

    local options = {
        signs = {
            add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
            change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
            delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
            topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
            changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
        },
    }

    gitsigns.setup(options)
end

return M
