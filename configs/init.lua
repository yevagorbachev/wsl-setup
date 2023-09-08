vim.cmd("source ~/.vimrc")
vim.cmd("packadd packer.nvim")

-- configs
local cf_surround = function()
	require("nvim-surround").setup {}
end
local cf_autopairs = function()
	require("nvim-autopairs").setup {}
end

local cf_comment = function()
	require("Comment").setup {opleader = {line = "<C-_>"}}
end

local cf_telescope = function()
	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>sf", builtin.find_files)
end

local cf_harpoon = function()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
	vim.keymap.set("n", "<C-j>", ui.nav_next)
	vim.keymap.set("n", "<C-k>", ui.nav_prev)
end

local cf_treesitter = function()
	local tsc = require("nvim-treesitter.configs")

	tsc.setup {
		ensure_installed = {
			"c", "cpp", "matlab", "python", -- proper languages
			"make", "cmake", "bash", "lua", "luadoc", -- scripting
			"html", "latex", "bibtex", "markdown_inline", -- text
			"git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", -- git
		},
		sync_install = true,
		auto_install = true,
		ignore_install = {},
		highlight = {
			enable = true,
			disable = {},
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<c-space>',
				node_incremental = '<c-space>',
				scope_incremental = '<c-s>',
				node_decremental = '<M-space>',
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['aa'] = '@parameter.outer',
					['ia'] = '@parameter.inner',
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[']m'] = '@function.outer',
					[']]'] = '@class.outer',
				},
				goto_next_end = {
					[']M'] = '@function.outer',
					[']['] = '@class.outer',
				},
				goto_previous_start = {
					['[m'] = '@function.outer',
					['[['] = '@class.outer',
				},
				goto_previous_end = {
					['[M'] = '@function.outer',
					['[]'] = '@class.outer',
				},
			},
			swap = {
				enable = true,
				swap_next = {
					['<leader>a'] = '@parameter.inner',
				},
				swap_previous = {
					['<leader>A'] = '@parameter.inner',
				},
			},
		}
	}
end

local cf_lspzero = function()
	-- setup and configure lsp-zero
	local lsp = require("lsp-zero").preset {}

	lsp.on_attach(function(_, bufnr)
		local opts = {buffer = bufnr, remap = false}

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end)

	local lspc = require("lspconfig")
	lspc.lua_ls.setup {lsp.nvim_lua_ls()}
	lspc.clangd.setup {}
	lspc.texlab.setup {}

	lsp.setup()

	-- setup completion
	local cmp = require("cmp")
	local cmp_action = require("lsp-zero").cmp_action()

	-- load luasnips
	local ls = require("luasnip")
	require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

	ls.config.set_config {
		enable_autosnippets = true
	}

	cmp.setup {
		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
			end
		},
		mapping = {
			-- `Enter` key to confirm completion
			['<CR>'] = cmp.mapping.confirm({select = true}),
			-- Ctrl+Space to trigger completion menu
			['<C-Space>'] = cmp.mapping.complete(),
			-- Navigate between snippet placeholder
			['<C-f>'] = cmp_action.luasnip_jump_forward(),
			['<C-b>'] = cmp_action.luasnip_jump_backward(),

			-- ['<Tab>'] = cmp_action.tab_complete(),
			-- ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
			['<Tab>'] = cmp_action.luasnip_supertab(),
			['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		},
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert"
		},
		sources = {
			{name = "luasnip", keyword_length = 2, priority = 3},
			{name = "nvim_lsp", keyword_lenghth = 3, priority = 2},
			{name = "buffer", keyword_length = 3, priority = 1}
		},
		view = {
			entries = 'custom'
		},
		enabled = function()
			-- disable completion in comments
			local context = require 'cmp.config.context'
			-- keep command mode completion enabled when cursor is in a comment
			if vim.api.nvim_get_mode().mode == 'c' then
				return true
			else
				return not context.in_treesitter_capture("comment")
					and not context.in_syntax_group("Comment")
			end
		end,
	}
end

local cf_tsp = function()
	vim.keymap.set("n", "<leader>tsn", function() vim.cmd("TSNodeUnderCursor") end)
end
-- run packer, loading configs
local packer = require("packer")
packer.startup( function(use)
	-- Packer
	use "wbthomason/packer.nvim"

	-- Basics: Autopairs, Surround, Comment
	use {
		"kylechui/nvim-surround",
		tag = "*",
		config = cf_surround
	}
	use {
		"windwp/nvim-autopairs",
		config = cf_autopairs
	}
	use {
		"numToStr/comment.nvim",
		config = cf_comment
	}

	-- Navigation: Telescope & Harpoon
	use {
		"nvim-telescope/telescope.nvim",
		tag = "*",
		requires = {"nvim-lua/plenary.nvim"},
		config = cf_telescope
	}

	use {
		"theprimeagen/harpoon",
		requires = {"nvim-lua/plenary.nvim"},
		config = cf_harpoon
	}

	-- Advanced language support
	use {
		"nvim-treesitter/nvim-treesitter",
		{run = ":TSUpdate"}, -- execute every time the package is updated
		config = cf_treesitter
	}

	use {
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter"
	}

	use {
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
		config = cf_tsp
	}

	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},

			-- Autocompletion
			{"L3MON4D3/LuaSnip"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-nvim-lsp"},
		},
		config = cf_lspzero
	}
	use {
		"hrsh7th/cmp-nvim-lsp",
	}
end)

