--[[
local git_branch = function()
    if vim.g.loaded_fugitive then
        local branch = vim.fn.FugitiveHead()
        if branch ~= "" then
            if vim.api.nvim_win_get_width(0) <= 80 then
                return " " .. string.upper(branch:sub(1, 2))
            end
            return " " .. string.upper(branch)
        end
    end
    return ""
end
--]]
local function git_branch()
	local branch = io.popen("git rev-parse --abbrev-ref HEAD 2> /dev/null")
	if branch then
		local name = branch:read("*l")
		branch:close()
		if name then
			return "*" .. name
		else
			return ""
		end
	end
end

local human_file_size = function()
    local format_file_size = function(file)
        local size = vim.fn.getfsize(file)
        if size <= 0 then return "" end
        local sufixes = {"B", "KB", "MB", "GB"}
        local i = 1
        while size > 1024 do
            size = size / 1024
            i = i + 1
        end
        return string.format(" %.0f%s ", size, sufixes[i])
    end

    local file = vim.api.nvim_buf_get_name(0)
    if string.len(file) == 0 then return "" end
    return format_file_size(file)
end

local smart_file_path = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name == "" then return "[No Name]" end
    local home = vim.env.HOME
    local is_term = false
    local file_dir = ""

    if buf_name:sub(1, 5):find("term") ~= nil then
        ---@type string
        file_dir = vim.env.PWD
        if file_dir == home then return "$HOME " end
        is_term = true
    else
        file_dir = vim.fs.dirname(buf_name)
    end

    file_dir = file_dir:gsub(home, "~", 1)

    if vim.api.nvim_win_get_width(0) <= 100 then
        file_dir = vim.fn.pathshorten(file_dir)
    end

    if is_term then
        return file_dir .. " "
    else
        return string.format("%s/%s ", file_dir, vim.fs.basename(buf_name))
    end
end

local modes = setmetatable({
    ["n"] = {"NORMAL", "N"},
    ["no"] = {"N·OPERATOR", "N·P"},
    ["v"] = {"VISUAL", "V"},
    ["V"] = {"V·LINE", "V·L"},
    [""] = {"V·BLOCK", "V·B"},
    [""] = {"V·BLOCK", "V·B"},
    ["s"] = {"SELECT", "S"},
    ["S"] = {"S·LINE", "S·L"},
    [""] = {"S·BLOCK", "S·B"},
    ["i"] = {"INSERT", "I"},
    ["ic"] = {"INSERT", "I"},
    ["R"] = {"REPLACE", "R"},
    ["Rv"] = {"V·REPLACE", "V·R"},
    ["c"] = {"COMMAND", "C"},
    ["cv"] = {"VIM·EX", "V·E"},
    ["ce"] = {"EX", "E"},
    ["r"] = {"PROMPT", "P"},
    ["rm"] = {"MORE", "M"},
    ["r?"] = {"CONFIRM", "C"},
    ["!"] = {"SHELL", "S"},
    ["t"] = {"TERMINAL", "T"}
}, {
    __index = function()
        return {"UNKNOWN", "U"} -- handle edge cases
    end
})

local get_current_mode = function()
    local mode = modes[vim.api.nvim_get_mode().mode]
    if vim.api.nvim_win_get_width(0) <= 80 then
        return string.format("%s ", mode[2]) -- short name
    else
        return string.format("%s ", mode[1]) -- long name
    end
end

---@diagnostic disable-next-line: lowercase-global
function status_line()
    return table.concat({
        get_current_mode(), -- get current mode
        git_branch(), -- branch name
        " %<", -- spacing
        smart_file_path(), -- smart full path filename
        "%h%m%r%w", -- help flag, modified, readonly, and preview
        "%=", -- right align
        "%{get(b:,'gitsigns_status','')}", -- gitsigns
        " %{strlen(&ft)?&ft[0].&ft[1:]:'None'} ", -- file type
        human_file_size(), -- file size
        " %-3.(%l,%c  %P", -- line number, column number
    })
end

vim.opt.statusline = "%!luaeval('status_line()')"
