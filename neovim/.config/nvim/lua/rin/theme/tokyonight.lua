local M = {}

M.plugin = {
  "folke/tokyonight.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "tokyonight",
  })
  if not ok then
    return
  end

  local tokyonight = require("tokyonight")

  vim.o.termguicolors = true

  tokyonight.setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = "italic",
      keywords = "italic",
      functions = "italic",
      variables = "italic",
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- fucntion will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors)
      colors.bg_float = "none"
    end,

    --- You can override specific highlights to use other groups or a hex color
    --- fucntion will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
      highlights.StatusLineModeIcon = { bg = "#9ece6a", fg = "#16161e", }
      highlights.StatusLineModeText = { bg = "#16161e", fg = "#9ece6a", style = "bold", }
      highlights.StatusLineGitBranchIcon = { bg = "#f7768e", fg = "#16161e", }
      highlights.StatusLineGitBranchText = { bg = "#16161e", fg = "#f7768e", }
      highlights.StatusLineLspIcon = { bg = "#7aa2f7", fg = "#16161e", }
      highlights.StatusLineLspText = { bg = "#16161e", fg = "#7aa2f7", }
      highlights.StatusLineFilePathIcon = { bg = "#e0af68", fg = "#16161e", }
      highlights.StatusLineFilePathText = { bg = "#16161e", fg = "#c0caf5", style = "bold", }
      highlights.StatusLineLocationIcon = { bg = "#bb9af7", fg = "#16161e", }
      highlights.StatusLineLocationText = { bg = "#16161e", fg = "#bb9af7", }

      highlights.TabbyBufferIcon = { bg = "#bb9af7", fg = "#16161e", }
      highlights.TabbyBufferTextChanged = { bg = "#16161e", fg = "#e0af68", }
      highlights.TabbyBufferTextCurrent = { bg = "#16161e", fg = "#bb9af7", }
      highlights.TabbyBufferText = { bg = "#16161e", fg = "#565f89", }

      highlights.TabbyTabIcon = { bg = "#7aa2f7", fg = "#16161e", }
      highlights.TabbyTabTextCurrent = { bg = "#16161e", fg = "#7aa2f7", }
      highlights.TabbyTabText = { bg = "#16161e", fg = "#565f89", }

      highlights.GitSignsAdd = { link = "String" }
      highlights.GitSignsChange = { link = "diffFile" }
      highlights.GitSignsDelete = { link = "Error" }

      -- neo-tree using fallback color { "GitGutter", "GitSigns" }
      highlights.GitGutterChange = { link = "@parameter" }
    end,
  })

  vim.cmd("colorscheme tokyonight")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
