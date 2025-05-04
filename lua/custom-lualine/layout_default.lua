local ThemeColours = require("nub.customlualine.colours")

local themeopts = {
	options = {
		theme = "default",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = {
			{
				function()
					return "  " .. require("lualine.utils.mode").get_mode() .. " "
				end,
			},
			{
				function()
					return ""
				end,
				colors = { fg = GeneralColours.trim },
			},
		},

		lualine_b = {
			{
				function()
					return ""
				end,
				colors = { fg = GeneralColours.trim },
				padding = { right = 1 },
			},

			{ "branch", padding = { left = 0, right = 1 } },

			{
				function()
					return ""
				end,
				colors = { fg = ThemeColours.normal.c.bg },
			},
		},

		lualine_c = {
			{
				"filetype",
				draw_empty = true,
				--				colored = false,
				colored = true,
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

			{ "diagnostics", padding = { left = 0, right = 2 } },
		},

		lualine_x = {
			{
				function()
					return require("noice").api.status.command.get()
				end,
				cond = function()
					return package.loaded["noice"] and require("noice").api.status.command.has()
				end,
				color = ThemeColours.normal.x,
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
				padding = 0,
			},
		},

		lualine_y = {},

		lualine_z = {

			require("custom-lualine.pomo").get_icon_table(),
			require("custom-lualine.pomo").get_text_table(),

			--{ "upower" },
			{
				function()
					local col = nil
					if require("upower").is_below_level_low() then
						col = GeneralColours.orange
					end
					if require("upower").is_below_level_critical()() then
						col = GeneralColours.red
					end
					if require("upower").is_chargin() then
						col = GeneralColours.green
					end
					return require("custom-lualine.cap").get_table(function()
						return require("upower").get_status_icon()
					end, col)
				end,
			},
			{
				function()
					return require("upower").get_status_text()
				end,
				padding = 0,
			},

			require("custom-lualine.cap").get_table(function()
				return " "
			end, nil),
			{ "datetime", padding = 1, style = "%a %R" },

			require("custom-lualine.cap").get_table(function()
				return " "
			end, nil),
			function()
				local f = require("lualine.components.progress")
				return f()
			end,
			padding = 0,
		},
	},
}

require("lualine").setup(themeopts)
