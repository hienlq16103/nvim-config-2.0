vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
vim.api.nvim_create_user_command("DT",function ()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config{
    virtual_text = not vt,
    -- underline = not vt,
    -- signs = not vt,
  }
end, { desc = "toggle diagnostic"})
vim.wo.relativenumber = true

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

--Plug('neoclide/coc.nvim', {['branch'] = 'release'})
--Plug('OmniSharp/omnisharp-vim')
Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')
require("custom.mapping.vimMapping")

