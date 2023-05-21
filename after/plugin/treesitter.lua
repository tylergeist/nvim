require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "rust" },

    autotag = {
        enable = true,
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally


    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        disable = { "html" },
        max_file_lines = nil,
        colors = {
            "#F7F6C5",
            "#DC6D04",
            "#C2E7DA",
            "#D7BFDC",
            "#92DCE5",
            "#9046CF",
            "#B76D68",
        },

    },
}
