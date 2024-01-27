local M = {}

M.setup = function(args)
  local keybind = require("rin.utils.keymap").keymap
  keybind("n", "<leader>pv", vim.cmd.Ex)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
