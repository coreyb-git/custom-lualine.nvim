local ModeColours = require("custom-lualine.colours_mode")

return {
	sections = {
		lualine_a = {
			{
				function()
					return ""
				end,
				padding = 1,
			},
		},

		lualine_b = {
			{
				function()
					return ""
				end,
				color = { fg = ModeColours.insert },
				padding = 0,
			},
		},

		lualine_c = {},
		lualine_x = {},
		lualine_y = {},

		lualine_z = {
			{ "datetime", padding = { left = 1, right = 1 }, style = "%a %R" },
		},
	},
}
