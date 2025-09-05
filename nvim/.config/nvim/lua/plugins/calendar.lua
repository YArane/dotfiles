return {
  "mattn/calendar-vim",
  event = "VeryLazy",
  cmd = "Calendar",
  keys = {
    { "<leader>wc", "<cmd>Calendar<cr>", desc = "Calendar" },
  },
  init = function()
    -- Disable default calendar mappings (<leader>cal/caL)
    vim.g.calendar_no_mappings = 1
  end,
}
