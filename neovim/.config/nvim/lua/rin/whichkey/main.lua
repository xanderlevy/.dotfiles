local M = {}

M.plugin = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

M.setup = function()
  -- local ok = require("rin.utils.check_requires").check({
  --   "aerial",
  -- })
  -- if not ok then
  --   return
  -- end

  --  local keymap = require("rin.utils.keymap").keymap

  --  keymap("n", "<Leader>o", ":AerialToggle float<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
