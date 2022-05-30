-- Here is the formatting config
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local lSsources = {
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.formatting.eslint.with({
    filetypes = {
      "javascript",
    },
  }),
  --null_ls.builtins.formatting.stylua.with({
  --  args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  --}),
	null_ls.builtins.formatting.prettier.with({
		filetypes = {
      "typescript",
      "html",
			"scss",
			"css"
		}
	}),
}

require("null-ls").setup({
  sources = lSsources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = vim.lsp.buf.format,
      })
    end
  end,
})
