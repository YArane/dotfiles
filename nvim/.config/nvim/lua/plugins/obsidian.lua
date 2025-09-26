return {
	"obsidian-nvim/obsidian.nvim",
	-- the obsidian vault in this default config  ~/obsidian-vault
	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	-- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
	version = "*",
	ft = "markdown",

	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "wiki",
				path = "/Users/yarden/vimwiki",
			},
			{
				name = "infraRED",
				path = "/Users/yarden/Library/Mobile Documents/iCloud~md~obsidian/Documents/InfraRED",
			},
		},
		legacy_commands = false,

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		daily_notes = {
			folder = "diary",
			date_format = "%Y-%m-%d",
			template = nil,
		},

		-- create new notes with sanitized link name, and in same dir as parent note
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9_-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return suffix
		end,

		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,
	},

	config = function(_, opts)
		require("obsidian").setup(opts)

		vim.keymap.set("n", "<leader>wq", function()
			--local current_buf = vim.api.nvim_get_current_buf()
			--local buf_name = vim.api.nvim_buf_get_name(current_buf)
			--if buf_name:match("%.md$") and vim.fn.isdirectory(vim.fn.expand("%:h")) == 1 then
			vim.cmd("Obsidian quick_switch")
			--else
			--vim.cmd("Obsidian open index")
			--end
		end, { desc = "quick switch" })

		vim.keymap.set("n", "<leader>w<leader>w", function()
			vim.cmd("Obsidian today")
		end, { desc = "Open diary" })

		vim.keymap.set("n", "<leader>wf", function()
			vim.cmd("Obsidian search")
		end, { desc = "Search wiki" })

		vim.keymap.set("n", "<leader>wt", function()
			vim.cmd("Obsidian toc")
		end, { desc = "Open table of contents" })

		vim.keymap.set("n", "<leader>wv", function()
			return require("obsidian").util.toggle_checkbox()
		end, { desc = "Cycle checkbox options" })

		vim.keymap.set("n", "<leader>wo", function()
			vim.cmd("Obsidian workspace")
		end, { desc = "Switch vault" })

		vim.keymap.set("n", "<leader>wb", function()
			vim.cmd("Obsidian backlinks")
		end, { desc = "Show backlinks" })
	end,
}
