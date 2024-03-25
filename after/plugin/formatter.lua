-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		python = {
			-- Black
			function()
				return {
					exe = "black", -- Make sure black is in your PATH
					args = { "--quiet", "-" },
					stdin = true,
				}
			end,
		},

		go = {
			-- goimports
			function()
				return {
					exe = "goimports",
					args = {},
					stdin = true,
				}
			end,
		},
		dart = {
			function()
				return {
					exe = "dart",
					args = { "format" },
					stdin = true,
				}
			end,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.py,*.js,*.ts,*.html,*.css,*.go,*.lua,*.dart FormatWrite
  augroup END
]],
	true
)
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.go",
	callback = function()
		vim.fn.jobstart({ "staticcheck", vim.fn.expand("%:p") }, {
			on_stdout = function(_, data)
				if data then
					for _, v in ipairs(data) do
						if v ~= "" then
							print(v)
						end
					end
				end
			end,
			stdout_buffered = true,
		})
	end,
})
