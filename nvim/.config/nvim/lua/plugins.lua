return {
	{"github/copilot.vim"},
<<<<<<< HEAD
=======
	{"tpope/vim-vinegar"},
>>>>>>> 5643639 (plugin updates)
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "rebelot/kanagawa.nvim" },
  {
    "vim-scripts/RltvNmbr.vim",
    lazy = false,
    config = function()
      -- Enable RltvNmbr for all buffers
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*",
        callback = function()
          vim.cmd("RltvNmbr")
        end
      })
    end,
  },
	{ "tpope/vim-fugitive" },
  {'stefandtw/quickfix-reflector.vim'},
  {'tpope/vim-sensible'},
  {'Raimondi/delimitMate'},
  {'tpope/vim-surround'},
  {'godlygeek/tabular'},
  {'ervandew/supertab'},
  {'leafgarland/typescript-vim'},
  {'vim-ruby/vim-ruby'},
  {'cespare/vim-toml'},
  {'pangloss/vim-javascript'},
  {'mxw/vim-jsx'},
  {'othree/html5.vim'},
  {'jparise/vim-graphql'},
  {'tpope/vim-rails'},
  {'tpope/vim-rake'},
  {'tpope/vim-bundler'},
  {'tpope/vim-rbenv'},
  {'tpope/vim-rhubarb'},                
  {'rust-lang/rust.vim' },              
  {'MaxMEllon/vim-jsx-pretty'},
  {'martinda/Jenkinsfile-vim-syntax'},
  {'thoughtbot/vim-rspec'},
  {'leafOfTree/vim-svelte-plugin'},
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
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
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},
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
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggleterm")
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
	-- AI CODING
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
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
				-- config = function()
				-- 	require("copilot").setup({})
				-- end, -- for providers='copilot'
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
