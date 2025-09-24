return {
	"AstroNvim/astrocore",
	opts = {
		conceallevel = 2,
		mappings = {
			n = {
				-- diable default bindings
				["<C-q>"] = false,
				["<C-s>"] = false,
				["<leader>xl"] = false,
				["<leader>xq"] = false,

				["<leader>x"] = { "<cmd>bd<cr>", desc = "buffer delete" },

				-- common typo
				["q:"] = ":",

				-- buffer navigation
				["<S-l>"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
					end,
					desc = "Next buffer",
				},
				["<S-h>"] = {
					function()
						require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
					end,
					desc = "Previous buffer",
				},

				-- quick buffer switching
				["<Tab>"] = {
					function()
						if #vim.t.bufs > 1 then
							require("snacks.picker").buffers()
						end
					end,
					desc = "Switch Buffers",
				},

				-- vimwiki
				["<leader>w"] = { false, desc = "󰏫 Vimwiki" },
				["<leader>ww"] = { "<cmd>VimwikiIndex<cr>", desc = "VimWiki Index" },

				["<BS>"] = { "<C-o>", desc = "Go back in jumplist" },

				-- Neotree
				["<A-1>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
				["<leader>e"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },

				-- Symbols (Aerial)
				["<leader>o"] = {
					function()
						require("aerial").toggle()
					end,
					desc = "Symbols outline",
				},
			},
		},
	},
}
