return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        -- diable default bindings
        ["<C-q>"] = false,
        ["<C-s>"] = false,

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
        ["<leader>w"] = { desc = "󰏫 Vimwiki" },
        ["<leader>ww"] = { desc = "Vimwiki Index" },

        -- Neotree
        ["<A-1>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["<leader>e"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },

        -- Symbols (Aerial)
        ["<leader>o"] = {
          function() require("aerial").toggle() end,
          desc = "Symbols outline"
        },
      }


    }
  }
}
