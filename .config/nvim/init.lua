require("config")

vim.g.loaded_matchparen = nil -- Custom plugin for also matching parentheses in strings
vim.cmd("runtime plugin/matchparen.vim")
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#fabd2f", bg = "#504945", bold = true })

vim.o.number         = true
vim.o.relativenumber = true

vim.o.mouse = "a" -- [a] all previous modes
vim.o.clipboard = "unnamedplus" -- A variant of the "unnamed" flag which uses the clipboard register "+"

vim.o.smartindent = true
vim.o.autoindent  = true -- Copy indent from current line when starting a new line

vim.o.hlsearch       = false
vim.o.incsearch      = true
vim.o.termguicolors  = true
vim.o.maxsearchcount = 9999

-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#0F0F0F" })
-- vim.opt.colorcolumn = "80" -- Vertical line
-- vim.opt.textwidth = 80 -- Auto wraps at said width

-- Tabs and spaces
vim.o.expandtab  = true
vim.o.tabstop    = 4 -- Defines the column multiple used to display the Horizontal Tab character (ASCII 9);
vim.o.shiftwidth = 4 -- Number of columns that make up one level of (auto)indentation.

vim.o.list = true
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2F2F2F" })
vim.opt.listchars = { trail = "·", lead = "·" }

-- vim.opt.formatoptions:remove("c")
-- vim.o.formatprg = ""

-- Folding
vim.o.foldcolumn = "4" -- This will show a small column on the left of the window to indicate folds
vim.o.foldmethod = "expr"
vim.o.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel  = 0;
vim.api.nvim_set_hl(0, "Folded", { bg = '', fg = '#2f4f4f' })

local qdir = vim.fn.stdpath("config") .. "/queries"
for _, path in ipairs(vim.fn.glob(qdir .. "/*/*.scm", false, true)) do
    local lines = vim.fn.readfile(path)
    if not (lines[1] or ""):match("extends") then
        local lang = vim.fn.fnamemodify(path, ":h:t") -- e.g. "cpp"
        local name = vim.fn.fnamemodify(path, ":t:r") -- e.g. "folds"
        pcall(vim.treesitter.query.set, lang, name, table.concat(lines, "\n"))
    end
end

-- Make shenanigans
-- vim.opt.makeprg = "clang++ -Wall -Wextra % -o %<"

vim.o.scrolloff  = 6
vim.o.splitright = true

vim.o.cursorline    = true
vim.o.cursorlineopt = "number"

vim.o.wrap        = true
vim.o.linebreak   = true -- Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
vim.o.breakindent = true

vim.o.statusline = "%<%f %h%w%m%r%=%-14.(%l,%c%V%) %p%%"

-- LSPs
vim.lsp.enable('pyright') -- Python
vim.lsp.enable('clangd')  -- C++
vim.lsp.enable('lua_ls')  -- Lua

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        -- skip filetypes whose treesitter grammar is broken
        if vim.bo[args.buf].filetype == 'proto' then
            return
        end
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- CMDs
-- vim.cmd("au FileType qf resize 3")
vim.cmd("command! W w")
vim.cmd("command! Wq wq")
vim.cmd("command! Wqall wqall")
vim.cmd("command! Q q")
vim.cmd("command! Qall qall")

-- 2 = fast directory browsing; only obtains directory listings when the directory hasn't been seen before
vim.g.netrw_fastbrowse = 1

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

-- Disable comment continuation with o and enter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "o", "r" })
    end,
})

-- Buffer outline (list of functions, classes etc.)
-- TO DO

