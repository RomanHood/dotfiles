local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
    return
end

masonlsp.setup({
    -- automatic_installation = true,
    ensure_installed = {
      "ruby_lsp",
      "rust_analyzer",
      "zls",
      "clangd",

      -- JS/TS
      "ts_ls",
      "eslint",

      -- CSS/Tailwind
      "cssls",
      "tailwindcss",

      -- SQL
      "sqlls",

      -- Python
      "pyright",
      "ruff",

      -- Data formats
      "jsonls",
      "yamlls",

      -- Markup
      "html",
      "emmet_ls"
    },
})
