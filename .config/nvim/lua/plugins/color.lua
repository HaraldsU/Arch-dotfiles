-- lua/plugins/color.lua
return {
	-- "tiagovla/tokyodark.nvim",
	-- "rebelot/kanagawa.nvim",
	"navarasu/onedark.nvim",

	lazy = false,
	priority = 1000,

	vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a4a" }),

	config = function()
		require("onedark").setup({
			-- style = "darker",
			style = "deep",
			-- style = "warmer",
			transparent = true,
			highlights = {
				CursorLineNr = { fg = "$orange", bg = "none" },
			},
		})
		require("onedark").load()
	end,

	-- config = function()
		-- -- vim.cmd.colorscheme("tokyodark")
		-- require("kanagawa").setup({
			-- -- theme = "dragon",
			-- theme = "wave",
			-- -- theme = "lotus",
			-- transparent = true,
			-- colors = {
				-- theme = {
					-- all = {
						-- ui = { bg_gutter = "none" },
					-- },
				-- },
			-- },
		-- })
		-- vim.cmd.colorscheme("kanagawa")
	-- end,
}

