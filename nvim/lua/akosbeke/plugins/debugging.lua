return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { "/Users/akosbeke/Code/dotfiles/nvim/debugger/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "lingoda",
        port = 9003,
        pathMappings = {
          ["/app/linguando"] = "/Users/akosbeke/Lingoda/lingoda/linguando",
        },
      },
    }

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { "/Users/akosbeke/Code/dotfiles/nvim/debugger/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }

    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "attach",
        name = "Lingoda - Quiz Engine",
        attachSimplePort = 9229,
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue Debugging" })
    vim.keymap.set("n", "<leader>do", dapui.open, { desc = "Open Debugger" })
    vim.keymap.set("n", "<leader>dx", dapui.close, { desc = "Close Debugger" })
  end,
}
