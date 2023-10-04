local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'tpope/vim-commentary',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        opts = {}
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {}
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = 'gruvbox',
    },
    'voldikss/vim-floaterm',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'kyazdani42/nvim-web-devicons' } },
    },
    'alexghergh/nvim-tmux-navigation',
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { { 'kyazdani42/nvim-web-devicons' } },
    },
    'lukas-reineke/indent-blankline.nvim',
    {
        'tpope/vim-fugitive',
        dependencies = { { 'tpope/vim-rhubarb' } },
        cmd = 'G',
    },
    'kdheepak/lazygit.nvim',
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = true
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        opts = { sign_priority = 20 }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'zbirenbaum/copilot.lua' },
            { 'zbirenbaum/copilot-cmp' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    },
    'L3MON4D3/LuaSnip',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
        },
    },
    'stevearc/vim-arduino',
    { import = 'akosbeke.plugins.bufdelete' },
}

local opts = {}

require("lazy").setup(plugins, opts)
