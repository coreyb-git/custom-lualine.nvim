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

vim.api.nvim_create_augroup("customlualine", {})
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "*:*" },
	callback = function()
		require("lualine").setup(events[vim.v.event.new_mode])
	end,
})
vim.api.nvim_create_augroup("end", {})

vim.cmd("set cmdheight=0")

require("lualine").setup({ options = { theme = "custom-lualine" } })
require("lualine").setup(events["n"])

return M
