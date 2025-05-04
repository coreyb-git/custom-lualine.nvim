local M = {}

require("custom-lualine.colours")

local function get_table(func_name, colour)
	if func_name == nil then
		func_name = ""
	end
	if colour == nil then
		colour = GeneralColours.greyblue
	end
	return {
		func_name,
		color = { fg = colour },
		padding = { left = 0, right = 0 },
		separator = { left = "" },
	}
end

return M
