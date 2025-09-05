return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  keys = {
    { "<leader>ww", "<cmd>VimwikiIndex<cr>",      desc = "VimWiki Index" },
    { "<leader>wt", "<cmd>VimwikiTabIndex<cr>",   desc = "VimWiki Tab Index" },
    { "<leader>wd", "<cmd>VimwikiDiaryIndex<cr>", desc = "VimWiki Diary" },
  },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        syntax = "default",
        ext = ".wiki",
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
