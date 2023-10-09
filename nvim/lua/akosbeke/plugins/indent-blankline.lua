return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#504945", nocombine = true })

    require("ibl").setup({
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "dashboard",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
        },
        buftypes = { "terminal", "NvimTree" },
      },
    })
  end,
}
