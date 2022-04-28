vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")

function get_setup(name)
    return string.format('require("setup/%s")', name)
end

return require("packer").startup({
    function(use)
      
      use("wbthomason/packer.nvim")

      -- use({"ghifarit53/daycula-vim"})

			use({ 'AlphaTechnolog/pywal.nvim', as = 'pywal', requires = {"dylanaraps/wal.vim"} })

      use({ "kyazdani42/nvim-web-devicons" })
      
      use({
        "akinsho/toggleterm.nvim",
        config = get_setup("toggleterm")
      })

      use({"L3MON4D3/LuaSnip"})
      use({"saadparwaiz1/cmp_luasnip"})

      use({
        "nvim-lualine/lualine.nvim",
        config = get_setup("lualine"),
        event = "VimEnter",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
      })

      use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons", config = get_setup("bufferline") })

			use({
				"kyazdani42/nvim-tree.lua",
				requires = "kyazdani42/nvim-web-devicons",
				config = get_setup("nvim-tree")
			})

      use({
        "nvim-treesitter/nvim-treesitter",
        config = get_setup("treesitter"),
        run = ":TSUpdate",
      })
      use("nvim-treesitter/nvim-treesitter-textobjects")
      use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = get_setup("autopairs"),
      })
      use({
        "hrsh7th/nvim-cmp",
        requires = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-nvim-lua" },
          { "hrsh7th/cmp-buffer" },
          { "hrsh7th/cmp-path" },
          { "hrsh7th/cmp-cmdline" },
          { "hrsh7th/vim-vsnip" },
          { "hrsh7th/cmp-vsnip" },
          { "hrsh7th/vim-vsnip-integ" },
          { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
        },
        config = get_setup("cmp"),
      })

			use({
      "lewis6991/gitsigns.nvim",
      	requires = { "nvim-lua/plenary.nvim" },
      	event = "BufReadPre",
      	config = get_setup("gitsigns"),
    	})

      use({ "jose-elias-alvarez/null-ls.nvim", config = get_setup("null-ls") })

      use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })

      use({
        "numToStr/Comment.nvim",
        opt = true,
        keys = { "gc", "gcc" },
        config = get_setup("comment"),
      })

      use({
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        requires = {
          { "nvim-lua/popup.nvim" },
          { "nvim-lua/plenary.nvim" },
          { "windwp/nvim-spectre" },
          { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = get_setup("telescope"),
      })
      use({ "nvim-telescope/telescope-file-browser.nvim" })
      use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
      use({ "tpope/vim-surround" })

      -- use({ "windwp/nvim-ts-autotag" })
      use({
        "rmagatti/session-lens",
        requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
        config = get_setup("session"),
      })
      use({
        "winston0410/range-highlight.nvim",
        requires = { { "winston0410/cmd-parser.nvim" } },
        config = get_setup("range-highlight"),
      })

      if packer_bootstrap then
        require("packer").sync()
      end
    end,
    config = {
      display = {
        open_fn = require("packer.util").float,
      },
      profile = {
        enable = true,
        threshold = 1,
      },
    },
  })
