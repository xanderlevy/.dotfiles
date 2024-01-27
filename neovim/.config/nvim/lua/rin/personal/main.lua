local M = {}

M.plugin = {
  -- "editorconfig/editorconfig-vim",
  -- event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  -- # Personal Preferences
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  require("rin.personal.indent").setup()
  -- require("rin.personal.line").setup()
  require("rin.personal.window").setup()
  -- require("rin.personal.tab").setup()
  require("rin.personal.mouse").setup()
  require("rin.personal.keybinds").setup()
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
