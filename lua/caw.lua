local M = {}

function M.has_syntax(lnum, col)
	local bufnr = vim.api.nvim_get_current_buf()
	for _, capture in pairs(vim.treesitter.get_captures_at_pos(bufnr, lnum - 1, col - 1)) do
		for _, cap in pairs(capture) do
			if string.match(cap, "comment") then
				return true
			end
		end
	end

	return false
end

return M
