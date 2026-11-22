-- lua/plugins/color.lua
return {
    -- "tiagovla/tokyodark.nvim",
    -- "rebelot/kanagawa.nvim",
    "navarasu/onedark.nvim",

    lazy = false,
    priority = 1000,

    vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a4a" }),

    config = function()
        require("onedark").setup({
            -- style = "darker",
            style = "deep",
            -- style = "warmer",
            transparent = true,
            highlights = {
                CursorLineNr = { fg = "$orange", bg = "none" },
            },
        })
        require("onedark").load()
    end
}

