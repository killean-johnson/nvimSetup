require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enable = true},
    indent = {enable = true},
    autotag = {enable = true}
}
