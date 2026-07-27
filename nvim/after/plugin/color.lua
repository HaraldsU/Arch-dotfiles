-- require('onedark').setup({ 
	-- style = "dark" 
	-- style = "darker" 
	-- style = "cool" 
	-- style = "deep" 
	-- style = "warm" 
	-- style = "warmer" 
-- })
-- require('onedark').load()

vim.cmd.colorscheme("tokyodark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "NormalNC", { fg = "#a0a8cd", bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#212234", bg = "none" })

vim.api.nvim_set_hl(0, "SignColumn", { fg = "#a0a8cd", bg = "none" })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#a0a8cd", bg = "none" })

