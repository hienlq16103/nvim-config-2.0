local configs = require("plugins.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local pid = vim.fn.getpid()
local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "hls",
  "denols",
  "jdtls",
  "intelephense",
  "sqlls",
  "omnisharp",
  "cssls",
  "texlab",
  "taplo",
  "markdown_oxide",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig.clangd.setup{
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.omnisharp.setup({
  cmd = {"omnisharp-mono", "--languageserver", "--hostPID", tostring(pid)},
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities
})
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E302', 'E305', 'E265', 'E231', 'E128', 'E501'},
        }
      }
    }
  },
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities
}
