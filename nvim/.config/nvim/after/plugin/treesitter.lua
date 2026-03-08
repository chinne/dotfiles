--https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "c", "go", "html", "javascript", "json", "lua",
        "python", "rust", "tsx", "typescript", "yaml",
    },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
