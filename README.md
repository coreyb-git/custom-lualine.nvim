Customized lualine with decluttering when in insert mode.

Install with lazy:
```
return {
	{
		"git@github.com:coreyb-git/custom-lualine.nvim",
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"epwalsh/pomo.nvim",
			"coreyb-git/spotify-player.nvim",
			"coreyb-git/upower.nvim",
			"lewis6991/gitsigns.nvim",
			"folke/noice.nvim",
			"epwalsh/pomo.nvim",
		},
		opts = {},
		lazy = false,
	},
	{
		"folke/noice.nvim",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
			},
		},
	},
}
```
