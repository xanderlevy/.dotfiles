local M = {}

M.plugin = {
  "folke/neodev.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()

end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
