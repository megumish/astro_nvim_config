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
  },
    {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = { suggestion = { auto_trigger = true, debounce = 150 } },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      if not opts.mapping then opts.mapping = {} end
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      opts.mapping["<C-right>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-l>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_word() end
      end)

      opts.mapping["<C-down>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-j>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.accept_line() end
      end)

      opts.mapping["<C-c>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.dismiss() end
      end)

      return opts
    end,
  },
}
