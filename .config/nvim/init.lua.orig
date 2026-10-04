require("config")

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
-- vim.diagnostic.config({
  -- virtual_text = true,
  -- signs = true,
  -- underline = true,
-- })
vim.opt.foldmethod = "manual"
vim.opt.smartindent = true
-- vim.opt.hlsearch = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.colorcolumn = "80" -- Vertical line
-- vim.opt.textwidth = 80 -- Auto wraps at said width

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = {
	leadmultispace = "┊   ",
	tab = "┊ ",
}

vim.opt.formatoptions:remove("c")
vim.opt.formatprg = ""

vim.opt.scrolloff = 10
vim.opt.splitright = true

-- Cursorline
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.opt.cursorlineopt = "line"
-- vim.opt.cursorlineopt = "screenline"
-- vim.opt.cursorlineopt = "both"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.previewheight = 3
-- vim.opt.statusline = '%f%<'
vim.o.statusline = "%<%f %h%w%m%r%=%-14.(%l,%c%V%) %p%%"
vim.opt.maxsearchcount = 9999

-- LSPs
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

-- Treesitter
vim.treesitter.language.register("json", "jsonc")

-- CMDs
vim.cmd("au FileType qf resize 3")
vim.cmd("command! W w")
vim.cmd("command! Wq wq")
vim.cmd("command! Wqall wqall")

-- Folding
vim.api.nvim_create_augroup('remember_folds', { clear = true })

vim.api.nvim_create_autocmd('BufWinLeave', {
    group = 'remember_folds',
    pattern = '*',
    callback = function()
        if vim.fn.expand('%') ~= '' and vim.bo.filetype ~= 'netrw' then
            vim.cmd('mkview')
        end
    end
})
 
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = 'remember_folds',
    pattern = '*',
    callback = function()
        if vim.fn.expand('%') ~= '' and vim.bo.filetype ~= 'netrw' then
            vim.cmd('silent! loadview')
        end
    end
})

-- Make a 1-1 terminal layout
vim.api.nvim_create_user_command('Slay', function()
	vim.cmd('below 8split')
	vim.cmd('terminal')
end, {})

-- Make a 2-1 terminal layout
vim.api.nvim_create_user_command('Dlay', function()
	vim.cmd('below 8split')
	vim.cmd('terminal')
	vim.cmd('wincmd k')
	vim.cmd('vsplit')
end, {})

vim.g.vimtex_compiler_latexmk_engines = {
  ['_'] = '-xelatex',
}

-- Keep cursor position when pasting a line
vim.keymap.set("n", "p", function()
	local col = vim.fn.col(".")
	local linewise = vim.fn.getregtype(vim.v.register) == "V"
	vim.cmd('normal! "' .. vim.v.register .. vim.v.count1 .. "p")
	if linewise then
		vim.fn.cursor(0, col)
	end
end)

-- Buffer outline (list of functions, classes etc.)
-- TO DO
