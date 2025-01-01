require('conform').setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    haskell = { "fourmolou" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    nix = { "nixfmt" },
    rust = { "rustfmt" },
    typst = { "typstyle" }
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
})
