local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.proselint.with({
      extra_filetypes = { "asciidoc" },
    }),
    null_ls.builtins.code_actions.statix,

    null_ls.builtins.completion.tags,

    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.deadnix,
    null_ls.builtins.diagnostics.proselint.with({
      extra_filetypes = { "asciidoc" },
    }),
    null_ls.builtins.diagnostics.statix,
    null_ls.builtins.diagnostics.trail_space,

    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.typstyle,
  },
})
