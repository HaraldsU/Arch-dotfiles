-- return { "shortcuts/no-neck-pain.nvim" }
return {
	"shortcuts/no-neck-pain.nvim",
	opts = {
		buffers = {
			wo = {
				fillchars = "eob: ",
				cursorline = false,
				cursorcolumn = false,
			},
		},
		autocmds = {
			skipEnteringNoNeckPainBuffer = true,
		},
	},
}
