local saga = require("lspsaga")

saga.setup({
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-d>", scroll_up = "<C-u>" },
    -- use enter to open file with definition preview
    definition = {
        edit = "<CR>",
    },
    ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
    lightbulb = { enable = false },
})
