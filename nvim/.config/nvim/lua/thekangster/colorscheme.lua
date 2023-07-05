--[[
require('rose-pine').setup({
    variant = 'auto',
    disable_italics = true,
    highlight_groups = {
        StatusLine = { fg = 'white', blend = 10, bold = true, },
    }
})
--]]

function LoadRosePine()
    require("rose-pine").setup({
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
        dark_variant = "moon",
        bold_vert_split = true,
        -- Change specific vim highlight groups
        highlight_groups = {
            StatusLine = { fg = "white", bg = "none", bold = true, },
            TelescopePromptBorder = { fg = "muted" },
            TelescopeResultsBorder = { fg = "muted" },
            TelescopePreviewBorder = { fg = "muted" },
        },
    })
    vim.cmd("colorscheme rose-pine")
end

function LoadGruvbox()
    require("gruvbox").setup({
      palette_overrides = {
          dark0_hard = "#0E1018",
          --dark0_hard = "#0E1018",
          --bright_red = "#ea6962",
          --bright_green = "#a9b665",
          --bright_yellow = "#d8a657",
          --bright_blue = "#7daea3",
          --bright_purple = "#d3869b",
          --bright_aqua = "#89b482",
          --bright_orange = "#e78a4e",
          --bright_green = "#a9b665",
      },
      overrides = {
          -- Comment = {fg = "#626A73", italic = true, bold = true},
          -- #736B62,  #626273, #627273 

          -- statusline
          StatusLine = { fg = '#FFFDD1', bg = 'none', bold=true, reverse=false },
      },
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      dim_inactive = false,
      transparent_mode = true,
      contrast = "hard",
    })
    vim.cmd("colorscheme gruvbox")
    --require('gruvbox').load()
end

function LoadNoClownFiesta()
    require("no-clown-fiesta").setup({
        transparent = true, -- Enable this to disable the bg color
        styles = {
            -- You can set any of the style values specified for `:h nvim_set_hl`
            comments = {},
            keywords = {},
            functions = {},
            variables = {},
            type = { bold = true },
        },
    })

    vim.cmd [[colorscheme no-clown-fiesta]]

    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = "#70788a" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#bbbbbb" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "white", bold = true })
end

LoadNoClownFiesta()

