-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities to the default config
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

		-- gl: Show error in floating window
		vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
		
		-- [d: Go to previous error
		vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
		
		-- ]d: Go to next error
		vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
	end,
})

-- Configure language servers using vim.lsp.config (new nvim 0.11 API)
vim.lsp.config('gleam', {
	cmd = {'gleam', 'lsp'},
	filetypes = {'gleam'},
	root_markers = {'gleam.toml'},
	capabilities = capabilities,
})

vim.lsp.config('ocamllsp', {
	cmd = {'ocamllsp'},
	filetypes = {'ocaml', 'ocaml.menhir', 'ocaml.interface', 'ocaml.ocamllex', 'reason', 'dune'},
	root_markers = {'dune-project', 'dune-workspace', '.git'},
	capabilities = capabilities,
})

vim.lsp.config('ccls', {
	cmd = {'ccls'},
	filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda'},
	root_markers = {'.ccls', 'compile_commands.json', '.git'},
	capabilities = capabilities,
	init_options = {
		clang = {
			extraArgs = {
				"-Wall",
				"-Wextra",
			},
		},
	},
})

vim.lsp.config('texlab', {
	cmd = {'texlab'},
	filetypes = {'tex', 'plaintex', 'bib'},
	root_markers = {'.git', '.latexmkrc'},
	capabilities = capabilities,
})

-- Enable LSP servers for the configured filetypes
vim.lsp.enable({'gleam', 'ocamllsp', 'ccls', 'texlab'})

-- Configure nvim-cmp
local cmp = require('cmp')
cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'nvim_lsp_signature_help'},
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})
