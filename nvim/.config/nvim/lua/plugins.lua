return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
	{"github/copilot.vim"},
	{"tpope/vim-vinegar"},

	-- Core Dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	
	-- Theme & UI
	{ "rebelot/kanagawa.nvim" },
	
	-- Git Integration
	{ "tpope/vim-fugitive" },     -- Git commands
	{ "tpope/vim-rhubarb" },      -- GitHub integration
	{
	    "lewis6991/gitsigns.nvim", -- Git decorations
	    config = function()
	        require("configs.gitsigns")
	    end,
	},
	
	-- Essential Editing Tools
	{ "tpope/vim-surround" },     -- Surround text objects
	{ "godlygeek/tabular" },      -- Text alignment
	
	-- Framework-specific (keeping these as they provide unique features)
	{ "tpope/vim-rails" },        -- Rails commands & navigation
	{ "tpope/vim-rake" },         -- Rake integration
	{ "tpope/vim-bundler" },      -- Bundler integration
	{ "thoughtbot/vim-rspec" },   -- RSpec runner
	{ "rust-lang/rust.vim" },     -- Rust commands & integration
	
	-- Testing Tools
	{ 'stefandtw/quickfix-reflector.vim' },
	-- Modern UI Components
	{
	    "nvim-lualine/lualine.nvim",
	    event = "BufEnter",
	    config = function()
	        require("configs.lualine")
	    end,
	    dependencies = { "nvim-web-devicons" },
	},
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "css",
                "html",
                "ruby",
                "javascript",
                "lua",
                "json",
                "markdown",
                "rust",
                "toml",
                "tsx",
                "typescript",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
	},
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	},

	{ "onsails/lspkind-nvim" },
	{ "L3MON4D3/LuaSnip" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("configs.mason-lsp")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("configs.noice")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{ "lewis6991/impatient.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	},
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				-- enable = true,
				extra_groups = {
					"BufferLineTabClose",
					"BufferlineBufferSelected",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineSeparator",
					"BufferLineIndicatorSelected",
				},
				exclude_groups = {},
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				event = "InsertEnter",
				config = function()
					require("copilot").setup({})
				end, -- for providers='copilot'
			},
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
