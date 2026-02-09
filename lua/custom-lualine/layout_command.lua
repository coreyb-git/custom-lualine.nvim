return {
	options = {
		theme = "custom-lualine",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = {
			{
				function()
					return "COMMAND"
				end,
				padding = 1,
			},
		},

		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}
