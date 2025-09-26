return {
	"AstroNvim/astrocore",
	opts = {
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

				-- obsidian link nav
				["<Tab>"] = {
					function()
						require("obsidian.api").nav_link("next")
					end,
				},
				["<S-Tab>"] = {
					function()
						require("obsidian.api").nav_link("prev")
					end,
				},

				-- vimwiki
				--["<leader>w"] = { false, desc = "󰏫 Vimwiki" },
				--["<leader>ww"] = { "<cmd>VimwikiIndex<cr>", desc = "VimWiki Index" },
				--
				-- obsidian
				["<leader>w"] = { false, desc = "󰏫 wiki" },
				["<leader>ww"] = {
					"<cmd>e ~/vimwiki/index.md<cr>",
					desc = "Wiki Index",
				},
				["<leader>wi"] = {
					"<cmd>e /Users/yarden/Library/Mobile Documents/iCloud~md~obsidian/Documents/InfraRED/index.md<cr>",
					desc = "InfraRED Index",
				},

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
