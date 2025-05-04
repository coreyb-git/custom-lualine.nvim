require("nub.customlualine.colours")

return {
	sections = {
		lualine_a = {
			function()
				return "  "
			end,
		},

		lualine_b = {
			{
				"",
				color = { fg = ModeColours.insert },
			},
		},

		lualine_c = {},
		lualine_x = {},
		lualine_y = {},

		lualine_z = {
			{ "datetime", padding = 1, style = "%a %R" },
		},
	},
}
