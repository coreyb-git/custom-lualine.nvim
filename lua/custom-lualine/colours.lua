local GeneralColours = require("custom-lualine.colours_general")
local ModeColours = require("custom-lualine.colours_mode")

--basic layer
local a_fg = GeneralColours.black
local a_bg = GeneralColours.grey

local b_fg = GeneralColours.darkergrey
local b_bg = GeneralColours.darkgrey

local c_fg = GeneralColours.darkergrey
local c_bg = GeneralColours.black

local x_fg = c_fg
local x_bg = c_bg

local y_fg = c_fg
local y_bg = c_bg

local z_fg = b_fg
local z_bg = b_bg

local themecolours = {
	normal = {
		a = { fg = a_fg, bg = ModeColours.normal },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
	insert = {
		a = { fg = ModeColours.insert, bg = GeneralColours.black },
		b = { fg = ModeColours.insert, bg = GeneralColours.black },
		c = { fg = GeneralColours.black, bg = GeneralColours.black },

		x = { fg = GeneralColours.black, bg = GeneralColours.black },
		y = { fg = GeneralColours.black, bg = GeneralColours.black },
		z = { fg = GeneralColours.darkergrey, bg = GeneralColours.black },
	},
	command = {
		a = { fg = a_fg, bg = ModeColours.command },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
	visual = {
		a = { fg = a_fg, bg = ModeColours.visual },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
	replace = {
		a = { fg = a_fg, bg = ModeColours.replace },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
	terminal = {
		a = { fg = a_fg, bg = ModeColours.terminal },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
	inactive = {
		a = { fg = a_fg, bg = a_bg },
		b = { fg = b_fg, bg = b_bg },
		c = { fg = c_fg, bg = c_bg },

		x = { fg = x_fg, bg = x_bg },
		y = { fg = y_fg, bg = y_bg },
		z = { fg = z_fg, bg = z_bg },
	},
}

return themecolours
