--[[
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                    school = "~/notes/school",
                },
                default_workspace = "school",
            }
        }
    }
}
--]]
