GeneralColours = {
	black = "#282A36",
	grey = "#5e5f69",
	red = "#ff7070",
	pink = "#FF79C6",
	green = "#50fa7b",
	blue = "#a1b1e3",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	orange = "#FFB86C",
	darkgrey = "#3a3c4e",
	darkergrey = "#e9e9f4",

	trim = "#3a3c4e",
	icons_fg = "#282A36",
	icons_bg = "5e5f69",

	greygreen = "#77aa77",
	greyred = "#aa7777",
	greyblue = "#7777aa",
}

--modes
ModeColours = {
	insert = GeneralColours.green,
	command = GeneralColours.blue,
	visual = GeneralColours.pink,
	replace = GeneralColours.red,
	terminal = GeneralColours.cyan,
}

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

local z_fg = c_fg
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
		a = { fg = a_fg, bg = ModeColours.insert },
		b = { fg = GeneralColours.Black, bg = GeneralColours.Black },
		c = { fg = GeneralColours.Black, bg = GeneralColours.Black },

		x = { fg = GeneralColours.Black, bg = GeneralColours.Black },
		y = { fg = GeneralColours.Black, bg = GeneralColours.Black },
		z = { fg = GeneralColours.darkergrey, bg = GeneralColours.Black },
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
