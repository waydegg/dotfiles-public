local M = {}

-- Check if a value exists in a table
M.has_value = function(table, target_value)
	for _, value in ipairs(table) do
		if value == target_value then
			return true
		end
	end

	return false
end

return M
