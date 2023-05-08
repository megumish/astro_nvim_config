return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "gen740/SmoothCursor.nvim",
    event = "BufRead",
    config = function()
      require("smoothcursor").setup({
        autostart = true,
        cursor = "",          -- cursor shape (need nerd font)
        texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
        linehl = "CursorLine",   -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
        type = "default",        -- define cursor movement calculate function, "default" or "exp" (exponential).
        fancy = {
          enable = true,         -- enable fancy mode
          head = { cursor = "▶", texthl = "SmoothCursorRed", linehl = "CusorLine" },
          body = {
            { cursor = "▴", texthl = nil },
            { cursor = "▴", texthl = nil },
            { cursor = "◂", texthl = nil },
            { cursor = "◂", texthl = nil },
            { cursor = "▾", texthl = nil },
            { cursor = "▾", texthl = nil },
            { cursor = "▸", texthl = nil },
            { cursor = "▸", texthl = nil },
          },
          tail = { cursor = "▶", texthl = "SmoothCursorRed" }
        },
        flyin_effect = "bottom",   -- "bottom" or "top"
        speed = 1,                 -- max is 100 to stick to your current position
        intervals = 10,            -- tick interval
        priority = 10,             -- set marker priority
        timeout = 3000,            -- timout for animation
        threshold = 3,             -- animate if threshold lines jump
        disable_float_win = false, -- disable on float window
        enabled_filetypes = nil,   -- example: { "lua", "vim" }
        disabled_filetypes = nil,  -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
      })
    end,
  },
  {
    "danilamihailov/beacon.nvim",
    event = "BufRead",
  }
}
