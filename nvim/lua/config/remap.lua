vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("t", "<C-n>n", "<C-\\><C-n>")

-- Unmap arrow keys to force myself to use hjkl (can be reenabled later)
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")

-- Toggle spellchecking for LaTeX files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "tex",
--     callback = function()
--         vim.opt.spell = true
--         vim.opt.spelllang = "lv,en"
--     end
-- })

-- Spelling
vim.keymap.set('n', '<C-l>', function()
	vim.opt.spell = not vim.opt.spell:get()
	if vim.opt.spell then
		vim.opt.spelllang = "lv,en"
	end
end, { silent = true })

-- Bracket / quote auto-complete
-- vim.keymap.set("i", "{", "{<CR>}<Esc>ko", { noremap = true, silent = true })
-- vim.keymap.set("i", "{", "{}<Esc>ha", { noremap = true, silent = true })
-- vim.keymap.set("i", "(", "()<Esc>ha", { noremap = true, silent = true })
-- vim.keymap.set("i", "[", "[]<Esc>ha", { noremap = true, silent = true })
-- vim.keymap.set("i", '"', '""<Esc>ha', { noremap = true, silent = true })
-- vim.keymap.set("i", "'", "''<Esc>ha", { noremap = true, silent = true })
-- vim.keymap.set("i", "`", "``<Esc>ha", { noremap = true, silent = true })

vim.keymap.set('n', '<F3>', function()
  local view = vim.fn.winsaveview()   
  vim.cmd("normal! gg=G")             
  vim.fn.winrestview(view)            
end, { silent = true })

-- Templates:
vim.keymap.set("n", "<leader>ti", "<cmd>Telescope find_template type=insert<cr>", { desc = "Insert template" })
vim.keymap.set("n", "<leader>tt", "<cmd>Template<cr>", { desc = "Template (cmd)" })

-- Comments:
-- Normal mode: whole file
vim.keymap.set('n', '<leader>c', ':%s/^\\(\\s*\\)print/\\1# print/g<CR>', { desc = 'Comment prints (file)' })
vim.keymap.set('n', '<leader>u', ':%s/^\\(\\s*\\)# print/\\1print/g<CR>', { desc = 'Uncomment prints (file)' })

-- Visual mode: selection only
vim.keymap.set('v', '<leader>c', ':s/^\\(\\s*\\)print/\\1# print/g<CR>', { desc = 'Comment prints (selection)' })
vim.keymap.set('v', '<leader>u', ':s/^\\(\\s*\\)# print/\\1print/g<CR>', { desc = 'Uncomment prints (selection)' })

-- NoNeckPain
vim.keymap.set("n", "<leader>nn", vim.cmd.NoNeckPain)
vim.keymap.set("n", "<leader>n[", vim.cmd.NoNeckPainWidthUp)
vim.keymap.set("n", "<leader>n]", vim.cmd.NoNeckPainWidthDown)

