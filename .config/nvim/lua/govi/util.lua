local M = {}

---Split a string by a delimeter
---@param input string
---@param del string
---@return table<string>
M.string_split = function(input, del)
    if del == nil then
        del = "%s"
    end

    local output = {}
    for str in string.gmatch(input, "([^" .. del .. "]+)") do
        table.insert(output, str)
    end
    return output
end

---Check if a table contains a specific value
---@param input table
---@param compare any
---@return boolean
M.table_contains = function(input, compare)
    for _, v in ipairs(input) do
        if v == compare then
            return true
        end
    end

    return false
end

---Get the file extension from a file path
---@param file_path string
---@return string
M.get_file_extension = function(file_path)
    local split = M.string_split(file_path, ".")
    return split[#split]
end

---Get the file path of the current buffer
---@return string
M.get_current_file_path = function()
    return vim.api.nvim_buf_get_name(0)
end

---Get the file name of the current buffer, including extension
---@return string
M.get_current_file_name = function()
    local split = M.string_split(vim.api.nvim_buf_get_name(0), "/")
    return split[#split]
end

---Get the file name of the current buffer, excluding the extension
---@return string
M.get_current_file_name_noext = function()
    local file_name = M.get_current_file_name()
    local split = M.string_split(file_name, ".")
    return split[#split - 1]
end

---Get the file extension of the current buffer
---@return string
M.get_current_file_extension = function()
    return M.get_file_extension(vim.api.nvim_buf_get_name(0))
end

return M
