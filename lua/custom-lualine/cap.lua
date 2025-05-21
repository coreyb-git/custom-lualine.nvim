local M = {}

local GeneralColours = require("custom-lualine.colours_general")

function M.get_table(func_name, fg_colour, bg_colour)
	if func_name == nil then
		func_name = ""
	end
	if fg_colour == nil then
		fg_colour = GeneralColours.icons_fg
	end
	if bg_colour == nil then
		bg_colour = GeneralColours.icons_bg
	end

	return {
		func_name,
		color = { fg = fg_colour, bg = bg_colour },
		padding = { left = 0, right = 0 },
		separator = { left = "" },
	}
end

return M
