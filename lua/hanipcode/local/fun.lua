local M = {}

function M.map(tbl, fn)
	local result = {}
	for i, v in ipairs(tbl) do
		result[i] = fn(v, i)
	end
	return result
end

return M
