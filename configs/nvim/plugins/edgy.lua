require('edgy').setup {
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.4 },
      -- exclude floating windows
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    "Trouble",
    {
      ft = "trouble",
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    { ft = "qf", title = "QuickFix" },
    {
      ft = "help",
      size = { height = 20 },
      -- don't open help files in edgy that we're editing
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end,
    },
  },
  left = {
    {
      title = "Neo-Tree",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
      pinned = true,
      open = function()
        vim.api.nvim_input("<esc><space>e")
      end,
      size = { height = 0.5 },
    },
    {
      title = "Neo-Tree Git",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "git_status"
      end,
      pinned = true,
      open = "Neotree position=right git_status",
    },
    {
      title = "Neo-Tree Buffers",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "buffers"
      end,
      pinned = true,
      open = "Neotree position=top buffers",
    },
  },
  right = {
    {
      title = "Aerial",
      ft = "aerial",
      pinned = true,
      open = "AerialToggle",
    },
  },
}
