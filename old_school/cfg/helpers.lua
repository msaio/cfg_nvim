local helpers = {}

function helpers.SearchSelected()
  local selected_text = vim.fn.escape(vim.fn.getreg('a'), '/\\')
  vim.api.nvim_feedkeys('/\\V' .. selected_text .. '\n', 'n', true)
end

return helpers
