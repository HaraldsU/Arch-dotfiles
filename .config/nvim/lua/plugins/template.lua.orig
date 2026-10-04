return {
	"nvimdev/template.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
	config = function()
		require("template").setup({
			temp_dir = "~/.config/nvim/templates",
			-- author = "Your Name",
			-- email = "you@example.com",
		})
		require("telescope").load_extension("find_template")
	end,
}

