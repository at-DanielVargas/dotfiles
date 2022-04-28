-- Here is the formatting config
local null_ls = require("null-ls")
local lSsources = {
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.formatting.eslint.with({
    filetypes = {
      "javascript",
    },
  }),
  null_ls.builtins.formatting.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
	null_ls.builtins.formatting.prettier.with({
		filetypes = {
      "typescript",
			"html",
			"scss",
			"css"
		}
	})
}
require("null-ls").setup({
  sources = lSsources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
