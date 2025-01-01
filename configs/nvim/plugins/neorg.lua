require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          life = "~/Documents/notes/life",
          school = "~/Documents/notes/school",
        },
      },
    },
    ["core.export"] = {},
    ["core.journal"] = {
      config = {
        workspace = "life",
      },
    },
    ["core.integrations.treesitter"] = {
      config = {
        configure_parsers = true,
        install_parsers = true,
      }
    },
    ["core.integrations.image"] = {},
    ["core.latex.renderer"] = {
      config = {
        debounce_ms = 1500,
      }
    }
  },
}

-- vim.cmd('Neorg sync-parsers')
