local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('arduino_language_server', {
    cmd = {
        'arduino-language-server',
        '-cli-config',
        '/Users/akosbeke/Library/Arduino15/arduino-cli.yaml',
        '-clangd',
        'clangd',
        '-cli',
        'arduino-cli'
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
            command = 'silent! EslintFixAll',
            group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
        })
        -- vim.cmd.LspStop('eslint')
        -- return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'cssls',
    'intelephense',
    'graphql',
    'arduino_language_server',
    },
  handlers = {
    lsp.default_setup,
  },
})

-- Autocompletion
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'copilot'},
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  })
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
