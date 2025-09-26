--if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.o.conceallevel = 2

vim.keymap.set("n", "<leader>w", function() end, { desc = "󰏫 wiki" })
