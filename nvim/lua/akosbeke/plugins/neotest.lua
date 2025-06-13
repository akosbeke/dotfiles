return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "olimorris/neotest-phpunit",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit")({
          root_files = { "composer.json", "phpunit.xml", "phpunit.xml.dist", ".github" },
          filter_dirs = { "vendor" },
          -- TODO: Make this configurable if I have to use more than one PHP project
          env = {
            CONTAINER = "backend",
            REMOTE_PHPUNIT_BIN = "bin/phpunit",
            SUB_PATH = "/linguando",
          },
          phpunit_cmd = function()
            return "/Users/akosbeke/Code/dotfiles/nvim/lua/akosbeke/plugins/testing/dphpunit"
          end,
        }),
        require("neotest-vitest")({
          vitestCommand = function()
            return "/Users/akosbeke/Code/dotfiles/nvim/lua/akosbeke/plugins/testing/vitest"
          end,
          ---Custom criteria for a file path to determine if it is a vitest test file.
          ---@async
          ---@param file_path string Path of the potential vitest test file
          ---@return boolean
          is_test_file = function(file_path)
            if file_path == nil then
              return false
            end
            local is_test_file = false

            if string.match(file_path, "__tests__") then
              is_test_file = true
            end

            for _, x in ipairs({ "e2e", "spec", "test", "e2e%-spec" }) do
              for _, ext in ipairs({ "js", "jsx", "coffee", "ts", "tsx" }) do
                if string.match(file_path, "%." .. x .. "%." .. ext .. "$") then
                  is_test_file = true
                  goto matched_pattern
                end
              end
            end
            ::matched_pattern::
            return is_test_file
          end,
        }),
      },
    })
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.loop.cwd())
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
  },
}
