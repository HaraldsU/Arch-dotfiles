return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",          -- THIS is the missing line
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"javascript",
			"typescript",
			"python",
			"markdown",           -- needed for hover docs
			"markdown_inline",    -- needed for hover docs
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
