require("config")
require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})

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
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.colorcolumn = "80" -- Vertical line
vim.opt.textwidth = 80
vim.opt.formatoptions:remove("c")
vim.opt.formatprg = ""

vim.opt.scrolloff = 10
vim.opt.splitright = true
vim.opt.cursorline = true
-- vim.opt.wrap = false 
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.previewheight = 3
vim.lsp.enable('pyright')
vim.opt.statusline = '%F%<'
vim.opt.maxsearchcount = 9999

vim.cmd("au FileType qf resize 3")

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

