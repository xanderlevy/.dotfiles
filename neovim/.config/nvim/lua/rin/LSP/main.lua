-- # LSP

-- # LSP utils
require('rin.LSP.utils.icon')
require('rin.LSP.utils.cmp')
-- # LSP UI
require('rin.LSP.utils.lspsaga')
-- # LSP Status
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
  status_symbol = "",
  show_filename = true,
  diagnostics = false,
})
-- # LSP Config
require('rin.LSP.languages.typescript')
require('rin.LSP.languages.css')
require('rin.LSP.languages.svelte')
require('rin.LSP.languages.vue')
require('rin.LSP.languages.deno')
require('rin.LSP.languages.go')
require('rin.LSP.languages.cpp')
require('rin.LSP.languages.python')
-- format some markup and dif file
require('rin.LSP.languages.prettier')

-- # LuaSnip
require('rin.LSP.luasnip.main')
