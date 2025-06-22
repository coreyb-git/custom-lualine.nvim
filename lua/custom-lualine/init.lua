local M = {}

function M.setup(opts) end

local events = {
	["n"] = require("custom-lualine.layout_normal"),
	["v"] = require("custom-lualine.layout_visual"),
	["o"] = require("custom-lualine.layout_operator"),
	["i"] = require("custom-lualine.layout_insert"),
	["c"] = require("custom-lualine.layout_command"),
	["t"] = require("custom-lualine.layout_terminal"),
}

local function updateLuaLine()
	vim.schedule(function()
		require("lualine").setup(events[vim.api.nvim_get_mode().mode])
	end)
end

vim.api.nvim_create_augroup("customlualine", {})
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "*:*" },
	callback = updateLuaLine,
})
vim.api.nvim_create_augroup("end", {})

vim.cmd("set cmdheight=0")

require("lualine").setup({ options = { theme = "custom-lualine" } })
require("lualine").setup(events["n"])

return M
