require("nvim-treesitter.configs").setup({
    --autotag = {
    --  enable = true,
    --  filetypes = {
    --    "html",
    --    "javascript",
    --    "typescript",
    --    "markdown",
    --  },
    --},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<TAB>",
      },
    },
  })
  -- Setup treesitter
  local ts = require("nvim-treesitter.configs")
  ts.setup({ ensure_installed = {
		"javascript",
		"typescript",
		"php",
		"python",
		"scss",
		"css",
		"dockerfile",
		"lua",
		"rust",
    "html",
    "json"
	}, highlight = { enable = true, disable = {"html", "json"}, } })
