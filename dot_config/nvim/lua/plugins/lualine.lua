return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		function StatusLineCol()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local col = vim.fn.col(".")

			local percent = math.floor((current_line / total_lines) * 100)

			return string.format("Ln %d Cn %d | %d%%%%", current_line, col, percent)
		end
		local colors = {
			bg = "#1e1e2e", -- background
			fg = "#cdd6f4", -- foreground

			gray = "#6c7086",
			gray2 = "#313244",

			green = "#a6e3a1",
			yellow = "#f9e2af",
			red = "#f38ba8",
			blue = "#89b4fa",
			magenta = "#cba6f7",
			cyan = "#94e2d5",
		}
		local diff = {
			"diff",
			color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
			separator = { left = "", right = "" },
			symbols = { added = " ", modified = " ", removed = " " },

			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.yellow },
				removed = { fg = colors.red },
			},
		}
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", diff, "diagnostics" },
				lualine_c = {
					{
						"filename",
						path = 4,
					},
				},

				lualine_x = {},
				lualine_y = {
					{
						"lsp_status",
						symbols = {
							-- Standard unicode symbols to cycle through for LSP progress:
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							-- Standard unicode symbol for when LSP is done:
							done = "✓",
							-- Delimiter inserted between LSP names:
							separator = "|",
						},
						-- List of LSP names to ignore (e.g., `null-ls`):
						ignore_lsp = {},
						-- Display the LSP name
						show_name = true,
					},
				},
				lualine_z = { StatusLineCol },
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
