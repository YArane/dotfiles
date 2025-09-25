return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false }, -- Disable dashboard completely
  },
  -- init = function()
  --   -- Always open recent files on startup when no files specified
  --   vim.api.nvim_create_autocmd("VimEnter", {
  --     callback = function()
  --       -- Check if we started with no arguments and buffer is empty/unnamed
  --       local argc = vim.fn.argc()
  --       local bufname = vim.api.nvim_buf_get_name(0)
  --       local buftype = vim.bo.buftype
  --
  --       if argc == 0 and bufname == "" and buftype == "" then
  --         vim.defer_fn(function()
  --           require("snacks").picker.recent()
  --         end, 50)
  --       end
  --     end,
  --   })
  -- end,
}
