local ThemeColours = require("custom-lualine.colours")
local GeneralColours = require("custom-lualine.colours_general")

return {
	options = {
		--theme = "default",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = {
			{
				function()
					return " " .. require("lualine.utils.mode").get_mode()
				end,
				padding = 1,
			},
		},

		lualine_b = {
			{ "branch", padding = { left = 1, right = 1 } },
		},

		lualine_c = {
			{
				"filetype",
				draw_empty = true,
				colored = false,
				icon_only = true,
				separator = "",
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				padding = { left = 0, right = 1 },
				symbols = {
					modified = "󰤀", -- Text to show when the file is modified.
					readonly = "", -- Text to show when the file is non-modifiable or readonly.
					unnamed = " [No Name]", -- Text to show for unnamed buffers.
					newfile = " [New]", -- Text to show for newly created file before first write
				},
			},

			{
				"diff",
				diff_color = {
					added = { fg = GeneralColours.greygreen },
					modified = { fg = GeneralColours.greyblue },
					removed = { fg = GeneralColours.greyred },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				source = function()
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,

				padding = 2,
			},

			{
				"diagnostics",
				padding = 2,
			},
		},

		lualine_x = {
			{
				function()
					return require("noice").api.status.command.get()
				end,
				cond = function()
					return package.loaded["noice"] and require("noice").api.status.command.has()
				end,
				--color = ThemeColours.normal.x,
			},
			{
				function()
					return require("noice").api.status.mode.get()
				end,
				cond = function()
					return package.loaded["noice"] and require("noice").api.status.mode.has()
				end,
				color = ThemeColours.normal.x,
			},
			{
				function()
					return "  " .. require("dap").status()
				end,
				cond = function()
					return package.loaded["dap"] and require("dap").status() ~= ""
				end,
				color = ThemeColours.normal.x,
			},
			{
				function()
					return require("lazy.status").updates()
				end,
				cond = function()
					return require("lazy.status").has_updates()
				end,
				color = ThemeColours.normal.x,
			},

			{ -- spacer
				function()
					return " "
				end,
				padding = { left = 0, right = 0 },
			},
		},

		lualine_y = {},

		lualine_z = {
			require("custom-lualine.battery").get_icon_table(),
			{
				function()
					return require("upower").get_status_text()
				end,
				padding = 1,
			},

			require("custom-lualine.pomo").get_icon_table(),
			require("custom-lualine.pomo").get_text_table(),

			require("custom-lualine.cap").get_table(function()
				return " "
			end, nil, nil),
			{
				function()
					local f = require("lualine.components.progress")
					return f()
				end,

				padding = 1,
			},

			require("custom-lualine.cap").get_table(function()
				return " "
			end, nil, nil),
			{ "datetime", padding = 1, style = "%a %R" },
		},
	},
}
