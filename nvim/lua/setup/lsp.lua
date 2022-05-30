-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()


local on_attach = function(client, bufnr)
end

local servers = {"tsserver", "html", "pyright"}



require("nvim-lsp-installer").setup {
  ensure_installed = servers
}

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup {
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    on_attach = on_attach,
  }
end


-- require("lspconfig").tsserver.setup({
--   capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   on_attach = function(client)
--     client.resolved_capabilities.document_formatting = false
--   end,
-- })

-- LSP Prevents inline buffer annotations
vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_on_insert = false,
})

local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = "",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])
