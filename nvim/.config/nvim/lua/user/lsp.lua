local capabilities = require("cmp_nvim_lsp").default_capabilities(
vim.lsp.protocol.make_client_capabilities()
)

local nvim_lsp = require('lspconfig')
local set_keymap = function(bufnr, ...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
local opts = { noremap = true, silent = true }

-- lsp-specific keymaps
local on_attach = function(_, bufnr)
  set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  set_keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  set_keymap(bufnr, "n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  set_keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  set_keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  print("LSP attached!")
end

vim.diagnostic.config({ float = { source = 'always', border = border }, })

-- javascript lsp
nvim_lsp.tsserver.setup {
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
  capabilities = capabilities,
}

-- java lsp
nvim_lsp.jdtls.setup {
  cmd = { 'jdtls' },
  root_dir = function(fname)
    return nvim_lsp.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
  end
}

-- haskell lsp
nvim_lsp.hls.setup({
  on_attach = on_attach,
  settings = {
    haskell = {
      hlintOn = true,
      formattingProvider = "fourmolu",
      plugin = {
          hlint = {
              -- Disable stuff like camelCase checking
              -- or redundant brackets checking
              diagnosticsOn = false
          }
      }
    }
  }
})

-- lua lsp
nvim_lsp.lua_ls.setup {
  settings = {
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = runtime_path },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  }
}

--- c++ lsp
nvim_lsp.clangd.setup{
  cmd = { 'clangd', '--compile-commands-dir=.' }
}

-- prolog
require('user/prolog_lsp')
nvim_lsp.prolog_lsp.setup {
  on_attach = on_attach,
}

--- python
nvim_lsp.pylsp.setup{}

-- scala
nvim_lsp.metals.setup{}

-- GLSL
nvim_lsp.glslls.setup{}
