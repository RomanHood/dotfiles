return {
  { "tpope/vim-fugitive" }, -- Git commands
  { "tpope/vim-rails" }, -- Rails commands & navigation
  { "tpope/vim-vinegar" },
  { "thoughtbot/vim-rspec" },
  { "leafOfTree/vim-svelte-plugin" },
  { "MaxMEllon/vim-jsx-pretty" },
  { "tpope/vim-rails" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        dimInactive = true,
      })
      vim.cmd("colorscheme kanagawa")
    end,
    build = function()
      vim.cmd("KanagawaCompile")
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
          enable = true,
          enable_autocmd = false,
      },
      ensure_installed = {
          "markdown",
          "tsx",
          "typescript",
          "javascript",
          "toml",
          "c_sharp",
          "json",
          "yaml",
          "rust",
          "css",
          "html",
          "lua",
      },
      rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = false,
          max_file_lines = nil,
      },
      autotag = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    }
  },
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
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
