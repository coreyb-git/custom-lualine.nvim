local events = {
	["n"] = require("layout_normal"),
	["v"] = require("layout_visual"),
	["o"] = require("layout_operator"),
	["i"] = require("layout_insert"),
	["c"] = require("layout_command"),
	["t1"] = require("layout_terminal"),
}

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "*:*" },
	callback = function()
		local layout = events[vim.v.event]
		require("lualine").setup(layout)
	end,
})
