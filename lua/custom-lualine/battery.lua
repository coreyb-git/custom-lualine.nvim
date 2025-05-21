local M = {}
local function get_colour()
	local GeneralColours = require("custom-lualine.colours_general")
	local fgcolour = GeneralColours.icons_fg
	local bgcolour = GeneralColours.icons_bg
	if require("upower").is_below_level_low() then
		fgcolour = GeneralColours.black
		bgcolour = GeneralColours.orange
	end
	if require("upower").is_below_level_critical() then
		fgcolour = GeneralColours.black
		bgcolour = GeneralColours.red
	end
	if require("upower").is_charging() then
		fgcolour = GeneralColours.black
		bgcolour = GeneralColours.green
	end

	return { fg = fgcolour, bg = bgcolour }
end

function M.get_icon_table()
	local t = require("custom-lualine.cap").get_table()
	t[1] = function()
		return require("upower").get_status_icon()
	end
	t.color = function()
		return get_colour()
	end
	t.padding.left = 0
	t.padding.right = 0
	return t
end

return M
