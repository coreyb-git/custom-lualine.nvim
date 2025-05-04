local function pomo()
	local ok, p = pcall(require, "pomo")
	if not ok then
		return ""
	end

	local timer = p.get_first_to_finish()
	if timer == nil then
		return ""
	end

	return tostring(timer)
end

local M = {}

function M.is_visible()
	local s = pomo()
	if #s > 0 then
		return true
	end
end

local function geticon()
	if not M.is_visible() then
		return ""
	end
	return " "
end

function M.get_icon_table()
	local t = require("custom-lualine.cap").get_table()
	t[1] = geticon
	return t
end

function M.get_text_table()
	return {
		function()
			return pomo()
		end,
		padding = { left = 0, right = 0 },
	}
end

return M
