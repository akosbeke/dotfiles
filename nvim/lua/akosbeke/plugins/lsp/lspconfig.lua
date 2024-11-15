return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Show workspace symbols"
      keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_next, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure prisma orm server
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    })

    lspconfig["phpactor"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "php" },
      init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
      },
    })

    -- PHPactor LSP snippets
    local Float = require("plenary.window.float")

    vim.api.nvim_create_augroup("LspPhpactor", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = "LspPhpactor",
      callback = function()
        vim.api.nvim_create_user_command("LspPhpactorReindex", function()
          vim.lsp.buf_notify(0, "phpactor/indexer/reindex", {})
        end, {})
        vim.api.nvim_create_user_command("LspPhpactorConfig", function()
          LspPhpactorDumpConfig()
        end, {})
        vim.api.nvim_create_user_command("LspPhpactorStatus", function()
          LspPhpactorStatus()
        end, {})
        vim.api.nvim_create_user_command("LspPhpactorBlackfireStart", function()
          LspPhpactorBlackfireStart()
        end, {})
        vim.api.nvim_create_user_command("LspPhpactorBlackfireFinish", function()
          LspPhpactorBlackfireFinish()
        end, {})
      end,
    })

    local function showWindow(title, syntax, contents)
      local out = {}
      for match in string.gmatch(contents, "[^\n]+") do
        table.insert(out, match)
      end

      local float = Float.percentage_range_window(0.6, 0.4, { winblend = 0 }, {
        title = title,
        topleft = "┌",
        topright = "┐",
        top = "─",
        left = "│",
        right = "│",
        botleft = "└",
        botright = "┘",
        bot = "─",
      })

      vim.api.nvim_buf_set_option(float.bufnr, "filetype", syntax)
      vim.api.nvim_buf_set_lines(float.bufnr, 0, -1, false, out)
    end

    function LspPhpactorDumpConfig()
      local results, _ = vim.lsp.buf_request_sync(0, "phpactor/debug/config", { ["return"] = true })
      for _, res in pairs(results or {}) do
        pcall(showWindow, "Phpactor LSP Configuration", "json", res["result"])
      end
    end
    function LspPhpactorStatus()
      local results, _ = vim.lsp.buf_request_sync(0, "phpactor/status", { ["return"] = true })
      for _, res in pairs(results or {}) do
        pcall(showWindow, "Phpactor Status", "markdown", res["result"])
      end
    end

    function LspPhpactorBlackfireStart()
      local _, _ = vim.lsp.buf_request_sync(0, "blackfire/start", {})
    end
    function LspPhpactorBlackfireFinish()
      local _, _ = vim.lsp.buf_request_sync(0, "blackfire/finish", {})
    end

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
} -- requires plenary (which is required by telescope)
