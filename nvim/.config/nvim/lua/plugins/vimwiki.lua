if true then
	return
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--
return {
	"vimwiki/vimwiki",
	event = "VeryLazy",
	keys = {
		{ "<leader>wc", false }, -- don't need colors, use calendar instead
		{ "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "VimWiki Index" },
		{ "<leader>wt", "<cmd>VimwikiTabIndex<cr>", desc = "VimWiki Tab Index" },
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
		vim.g.vimwiki_folding = "custom"
	end,
}
