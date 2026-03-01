local M = {}

function M.setup(opts)
	--
end

local events = {
	["n"] = require("custom-lualine.layout_normal"),
	["v"] = require("custom-lualine.layout_visual"),
	["o"] = require("custom-lualine.layout_operator"),
	["i"] = require("custom-lualine.layout_insert"),
	["c"] = require("custom-lualine.layout_command"),
	["t"] = require("custom-lualine.layout_terminal"),
}

local function updateLuaLine()
	local command_height = 0
	local mode = vim.api.nvim_get_mode().mode
	if mode == "c" then
		command_height = 1
	end
	vim.cmd("set cmdheight=" .. command_height)

	local layout = events[mode]
	if layout then
		vim.schedule(function()
			require("lualine").setup(layout)
		end)
	end
end

local custom_ll_group = vim.api.nvim_create_augroup("customlualine", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
	group = custom_ll_group,
	--pattern = { "*:*" },
	callback = function()
		updateLuaLine()
		vim.cmd("redrawstatus")
	end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
	group = custom_ll_group,
	pattern = "*",
	callback = updateLuaLine,
})

-- throttle
local is_idle = false

local function set_refresh(rate)
	vim.schedule(function()
		require("lualine").setup({
			options = {
				refresh = {
					refresh_time = rate,
				},
			},
		})
	end)
end

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	group = custom_ll_group,
	callback = function()
		-- typing in insert mode triggers this event.
		if vim.api.nvim_get_mode().mode == "i" then
			return
		end

		if is_idle then
			set_refresh(math.floor(1000 / 15))
		end
		is_idle = false
	end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	group = custom_ll_group,
	callback = function()
		set_refresh(9000)
		is_idle = true
	end,
})

----

vim.schedule(updateLuaLine)

return M
