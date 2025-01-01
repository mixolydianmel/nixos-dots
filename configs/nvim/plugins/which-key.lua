local wk = require('which-key')

-- Setup
wk.setup()

-- TODO: Keybinds
wk.add({
  -- Window selection
  { "<C-h>",      "<C-w>h",                                                                               desc = "Select window left",             mode = { "n", "t" } },
  { "<C-j>",      "<C-w>j",                                                                               desc = "Select window down",             mode = { "n", "t" } },
  { "<C-k>",      "<C-w>k",                                                                               desc = "Select window up",               mode = { "n", "t" } },
  { "<C-l>",      "<C-w>l",                                                                               desc = "Select window right",            mode = { "n", "t" } },

  -- Window dimensions
  { "<C-Up>",     "<C-w>+",                                                                               desc = "Increase window height",         mode = { "n", "t" } },
  { "<C-Down>",   "<C-w>-",                                                                               desc = "Decrease window height",         mode = { "n", "t" } },
  { "<C-Left>",   "<C-w><",                                                                               desc = "Increase window width",          mode = { "n", "t" } },
  { "<C-Right>",  "<C-w>>",                                                                               desc = "Decrease window width",          mode = { "n", "t" } },

  -- Buffer switching
  { "<S-h>",      "<cmd>bprevious<cr>",                                                                   desc = "Prev buffer" },
  { "<S-l>",      "<cmd>bnext<cr>",                                                                       desc = "Next buffer" },
  { "<leader>bb", "<cmd>e #<cr>",                                                                         desc = "Switch to other buffer" },

  -- Clear hlsearch
  { "<esc>",      "<cmd>noh<cr><esc>",                                                                    desc = "Escape and clear hlsearch" },

  -- Add undo breaks
  { ",",          ",<c-g>u",                                                                              mode = "i" },
  { ".",          ".<c-g>u",                                                                              mode = "i" },
  { ";",          ";<c-g>u",                                                                              mode = "i" },

  -- Better indenting
  -- ["<"] = { "<gv", mode = "v" },
  -- [">"] = { ">gv", mode = "v" },

  -- Formatting
  { "<leader>cf", function() vim.lsp.buf.format { async = true } end,                                     desc = "Format",                         mode = { "n", "v" } },

  -- Diagnostics
  { "<leader>cd", function() vim.diagnostic.open_float() end,                                             desc = "Show line diagnostics" },
  { "]d",         function() vim.diagnostic.goto_next {} end,                                             desc = "Next Diagnostic" },
  { "[d",         function() vim.diagnostic.goto_prev {} end,                                             desc = "Prev Diagnostic" },
  { "]w",         function() vim.diagnostic.goto_next { 'WARN' } end,                                     desc = "Next Warning" },
  { "[w",         function() vim.diagnostic.goto_prev { 'WARN' } end,                                     desc = "Prev Warning" },
  { "]e",         function() vim.diagnostic.goto_next { 'ERROR' } end,                                    desc = "Next Error" },
  { "[e",         function() vim.diagnostic.goto_prev { 'ERROR' } end,                                    desc = "Prev Error" },

  -- Quit
  { "<leader>qq", "<cmd>qa<cr>",                                                                          desc = "Quit all" },

  -- Terminal
  { "<leader>ft", "<cmd>ToggleTerm<cr>",                                                                  desc = "Toggle Terminal",                mode = { "n" } },
  { "<c-/>",      "<cmd>ToggleTerm<cr>",                                                                  desc = "Toggle Terminal",                mode = { "n", "t" } },
  { "<esc><esc>", "<c-\\><c-n>",                                                                          desc = "Enter normal mode",              mode = "t" },

  -- Windows
  { "<leader>ww", "<C-W>p",                                                                               desc = "Other window" },
  { "<leader>wd", "<C-W>c",                                                                               desc = "Delete window" },
  { "<leader>w-", "<C-W>s",                                                                               desc = "Split window down" },
  { "<leader>w|", "<C-W>v",                                                                               desc = "Split window right" },

  -- LSP
  { "gd",         function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end,      desc = "Goto Definition" },
  { "gD",         function() vim.lsp.buf.declaration() end,                                               desc = "Goto Declaration" },
  { "gI",         function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end,  desc = "Goto Implementation" },
  { "gy",         function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T(y)pe Definition" },
  { "gr",         "<cmd>Telescope lsp_references<cr>",                                                    desc = "Goto References" },
  { "gK",         function() vim.lsp.buf.signature_help() end,                                            desc = "Signature Help" },
  { "K",          function() vim.lsp.buf.hover() end,                                                     desc = "Hover" },
  { "<c-k>",      function() vim.lsp.buf.signature_help() end,                                            desc = "Signature Help",                 mode = "i" },
  { "<leader>ca", function() vim.lsp.buf.code_action() end,                                               desc = "Code Action",                    mode = { "n", "v" } },
  { "<leader>cr", function() vim.lsp.buf.rename() end,                                                    desc = "Rename symbol" },

  -- Flash
  { "s",          function() require('flash').jump() end,                                                 desc = "Flash jump",                     mode = { "n", "x", "o" } },
  { "S",          function() require('flash').treesitter() end,                                           desc = "Flash treesitter",               mode = { "n", "x", "o" } },

  -- Buffer deletion
  { "<leader>bd", function() require('bufdelete').bufdelete(0) end,                                       desc = "Delete buffer" },
  { "<leader>bD", function() require('bufdelete').bufdelete(0, true) end,                                 desc = "Delete buffer (force)" },

  -- Neotree
  { "<leader>e",  "<cmd>Neotree toggle<cr>",                                                              desc = "Neotree toggle" },
  { "<leader>o",  "<cmd>Neotree<cr>",                                                                     desc = "Neotree focus" },

  -- Telescope
  { "<leader>ff", function() require('telescope.builtin').find_files() end,                               desc = "Find files" },
  { "<leader>fg", function() require('telescope.builtin').live_grep() end,                                desc = "Live grep" },
  { "<leader>fb", function() require('telescope.builtin').buffers() end,                                  desc = "Find buffers" },
  { "<leader>fr", function() require('telescope.builtin').oldfiles() end,                                 desc = "Find recent files" },

  -- Todo
  { "<leader>st", "<cmd>TodoTelescope<cr>",                                                               desc = "Search Todos" },
  { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIXME,FIX<cr>",                                       desc = "Search Todos/Fixes" },
  { "<leader>xt", "<cmd>TodoTrouble<cr>",                                                                 desc = "Search Todos (Trouble)" },
  { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIXME,FIX<cr>",                                         desc = "Search Todos/Fixes (Trouble)" },

  -- Trouble
  { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",                                          desc = "Document Diagnostics (Trouble)" },
  { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>",                                         desc = "Workspace Diagnostics (Trouble)" },
  { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",                                                       desc = "Location List (Trouble)" },
  { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",                                                      desc = "Quickfix List (Trouble)" },

  -- Aerial
  { "<leader>cs", "<cmd>AerialToggle<cr>",                                                                desc = "Symbols Outline (Aerial)" },

  -- Edgy
  { "<leader>ue", function() require('edgy').toggle() end,                                                desc = "Edgy Toggle" },

  -- LuaSnip
  { "<c-l>",      function() require('luasnip').jump(1) end,                                              desc = "Jump to next snippet position",  mode = { "i", "s" },     silent = true },
  { "<c-h>",      function() require('luasnip').jump(-1) end,                                             desc = "Jump to prev snippet position",  mode = { "i", "s" },     silent = true },

  -- Neorg
  { "<leader>nj", "<cmd>Neorg journal<cr>",                                                               desc = "Open journal menu" },
  { "<leader>nt", "<cmd>Neorg journal today<cr>",                                                         desc = "Go to today's journal" },
  { "<leader>ny", "<cmd>Neorg journal yesterday<cr>",                                                     desc = "Go to yesterday's journal" },
})

-- Keybinds (mostly from LazyVim)
-- WARN: Deprecated
-- wk.register({
--   -- Window selection
--   ["<C-h>"] = { "<C-w>h", "Select window left", mode = { "n", "t" } },
--   ["<C-j>"] = { "<C-w>j", "Select window down", mode = { "n", "t" } },
--   ["<C-k>"] = { "<C-w>k", "Select window up", mode = { "n", "t" } },
--   ["<C-l>"] = { "<C-w>l", "Select window right", mode = { "n", "t" } },
--
--   -- Window dimensions
--   ["<C-Up>"] = { "<C-w>+", "Increase window height", mode = { "n", "t" } },
--   ["<C-Down>"] = { "<C-w>-", "Decrease window height", mode = { "n", "t" } },
--   ["<C-Left>"] = { "<C-w><", "Increase window width", mode = { "n", "t" } },
--   ["<C-Right>"] = { "<C-w>>", "Decrease window width", mode = { "n", "t" } },
--
--   -- Buffer switching
--   ["<S-h>"] = { "<cmd>bprevious<cr>", "Prev buffer" },
--   ["<S-l>"] = { "<cmd>bnext<cr>", "Next buffer" },
--   ["<leader>bb"] = { "<cmd>e #<cr>", "Switch to other buffer" },
--
--   -- Clear hlsearch
--   ["<esc>"] = { "<cmd>noh<cr><esc>", "Escape and clear hlsearch" },
--
--   -- Add undo breaks
--   [","] = { ",<c-g>u", mode = "i" },
--   ["."] = { ".<c-g>u", mode = "i" },
--   [";"] = { ";<c-g>u", mode = "i" },
--
--   -- Better indenting
--   -- ["<"] = { "<gv", mode = "v" },
--   -- [">"] = { ">gv", mode = "v" },
--
--   -- Formatting
--   ["<leader>cf"] = { function() vim.lsp.buf.format { async = true } end, "Format", mode = { "n", "v" } },
--
--   -- Diagnostics
--   ["<leader>cd"] = { function() vim.diagnostic.open_float() end, "Show line diagnostics" },
--   ["]d"] = { function() vim.diagnostic.goto_next {} end, "Next Diagnostic" },
--   ["[d"] = { function() vim.diagnostic.goto_prev {} end, "Prev Diagnostic" },
--   ["]w"] = { function() vim.diagnostic.goto_next { 'WARN' } end, "Next Warning" },
--   ["[w"] = { function() vim.diagnostic.goto_prev { 'WARN' } end, "Prev Warning" },
--   ["]e"] = { function() vim.diagnostic.goto_next { 'ERROR' } end, "Next Error" },
--   ["[e"] = { function() vim.diagnostic.goto_prev { 'ERROR' } end, "Prev Error" },
--
--   -- Quit
--   ["<leader>qq"] = { "<cmd>qa<cr>", "Quit all" },
--
--   -- Terminal
--   ["<leader>ft"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal", mode = { "n" } },
--   ["<c-/>"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal", mode = { "n", "t" } },
--   ["<esc><esc>"] = { "<c-\\><c-n>", "Enter normal mode", mode = "t" },
--
--   -- Windows
--   ["<leader>ww"] = { "<C-W>p", "Other window" },
--   ["<leader>wd"] = { "<C-W>c", "Delete window" },
--   ["<leader>w-"] = { "<C-W>s", "Split window down" },
--   ["<leader>w|"] = { "<C-W>v", "Split window right" },
--
--   -- LSP
--   ["gd"] = { function() require('telescope.builtin').lsp_definitions({ reuse_win = true }) end, "Goto Definition" },
--   ["gD"] = { function() vim.lsp.buf.declaration() end, "Goto Declaration" },
--   ["gI"] = { function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end, "Goto Implementation" },
--   ["gy"] = { function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end, "Goto T(y)pe Definition" },
--   ["gr"] = { "<cmd>Telescope lsp_references<cr>", "Goto References" },
--   ["gK"] = { function() vim.lsp.buf.signature_help() end, "Signature Help" },
--   ["K"] = { function() vim.lsp.buf.hover() end, "Hover" },
--   ["<c-k>"] = { function() vim.lsp.buf.signature_help() end, "Signature Help", mode = "i" },
--   ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "Code Action", mode = { "n", "v" } },
--   ["<leader>cr"] = { function() vim.lsp.buf.rename() end, "Rename symbol" },
--
--   -- Flash
--   ["s"] = { function() require('flash').jump() end, "Flash jump", mode = { "n", "x", "o" } },
--   ["S"] = { function() require('flash').treesitter() end, "Flash treesitter", mode = { "n", "x", "o" } },
--
--   -- Buffer deletion
--   ["<leader>bd"] = { function() require('bufdelete').bufdelete(0) end, "Delete buffer" },
--   ["<leader>bD"] = { function() require('bufdelete').bufdelete(0, true) end, "Delete buffer (force)" },
--
--   -- Neotree
--   ["<leader>e"] = { "<cmd>Neotree toggle<cr>", "Neotree toggle" },
--   ["<leader>o"] = { "<cmd>Neotree<cr>", "Neotree focus" },
--
--   -- Telescope
--   ["<leader>ff"] = { function() require('telescope.builtin').find_files() end, "Find files" },
--   ["<leader>fg"] = { function() require('telescope.builtin').live_grep() end, "Live grep" },
--   ["<leader>fb"] = { function() require('telescope.builtin').buffers() end, "Find buffers" },
--   ["<leader>fr"] = { function() require('telescope.builtin').oldfiles() end, "Find recent files" },
--
--   -- Todo
--   ["<leader>st"] = { "<cmd>TodoTelescope<cr>", "Search Todos" },
--   ["<leader>sT"] = { "<cmd>TodoTelescope keywords=TODO,FIXME,FIX<cr>", "Search Todos/Fixes" },
--   ["<leader>xt"] = { "<cmd>TodoTrouble<cr>", "Search Todos (Trouble)" },
--   ["<leader>xT"] = { "<cmd>TodoTrouble keywords=TODO,FIXME,FIX<cr>", "Search Todos/Fixes (Trouble)" },
--
--   -- Trouble
--   ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
--   ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
--   ["<leader>xL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
--   ["<leader>xQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
--
--   -- Aerial
--   ["<leader>cs"] = { "<cmd>AerialToggle<cr>", "Symbols Outline (Aerial)" },
--
--   -- Edgy
--   ["<leader>ue"] = { function() require('edgy').toggle() end, "Edgy Toggle" },
--
--   -- LuaSnip
--   ["<c-l>"] = { function() require('luasnip').jump(1) end, "Jump to next snippet position", mode = { "i", "s" }, silent = true },
--   ["<c-h>"] = { function() require('luasnip').jump(-1) end, "Jump to prev snippet position", mode = { "i", "s" }, silent = true },
--
--   -- Neorg
--   ["<leader>nj"] = { "<cmd>Neorg journal<cr>", "Open journal menu" },
--   ["<leader>nt"] = { "<cmd>Neorg journal today<cr>", "Go to today's journal" },
--   ["<leader>ny"] = { "<cmd>Neorg journal yesterday<cr>", "Go to yesterday's journal" },
-- })
