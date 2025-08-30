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
	local mode = vim.api.nvim_get_mode().mode
	vim.schedule(function()
		require("lualine").setup(events[mode])
	end)
end

local cll_group = vim.api.nvim_create_augroup("customlualine", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
	group = cll_group,
	pattern = { "*:*" },
	callback = updateLuaLine,
})

vim.cmd("set cmdheight=0")

--	require("lualine").setup({ options = { theme = "custom-lualine" } })
--	require("lualine").setup(events["n"])
vim.schedule(updateLuaLine)

return M
