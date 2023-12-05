-- function UpdateSearchList(element)
  -- -- Extend search_list
  -- local search_list = vim.b.search_list
  -- if search_list == nil then
    -- search_list = {}
  -- end
  -- local size = #search_list
  -- table.insert(search_list, element)
  -- local search_index = size + 1
  -- vim.b.search_list = search_list
  -- vim.b.search_index = search_index
-- end

-- Function to update search list
local function UpdateSearchList(element)
  local search_list = vim.b.search_list or {}
  table.insert(search_list, element)
  vim.b.search_list = search_list
  vim.b.search_index = #search_list
end

-- Function to navigate through search list
local function NavigateSearchList(direction)
  local current_search_index = vim.b.search_index or 0
  local search_list = vim.b.search_list or {}
  if current_search_index == 0 or search_list == {} then
    return
  end
  local size = #search_list
  local new_index

  if direction == "previous" then
    new_index = (current_search_index == 1) and size or current_search_index - 1
  else -- "next"
    new_index = (current_search_index == size) and 1 or current_search_index + 1
  end

  vim.b.search_index = new_index
  local selected_text = search_list[new_index]
  vim.api.nvim_feedkeys('/\\V' .. selected_text .. '\n', 'n', true)
end


function SearchSelected()
  -- Highlight selected text
  vim.api.nvim_command("normal! gv\"ay")
  local selected_text = vim.fn.escape(vim.fn.getreg('a'), '/\\')
  vim.api.nvim_feedkeys('/\\V' .. selected_text .. '\n', 'n', true)
  -- Add selected_text to search_list
  UpdateSearchList(selected_text)
end

-- function PreviousSearch()
  -- local current_search_index = vim.b.search_index
  -- local search_list = vim.b.search_list
  -- local size = #search_list
  -- -- Update search index
  -- if current_search_index == 1 then
    -- vim.b.search_index = size
  -- else
    -- vim.b.search_index = current_search_index - 1
  -- end
  -- local selected_text = search_list[vim.b.search_index]
  -- -- Update hightlight text
  -- vim.api.nvim_feedkeys('/\\V' .. selected_text .. '\n', 'n', true)
-- end

-- function NextSearch()
  -- local current_search_index = vim.b.search_index
  -- local search_list = vim.b.search_list
  -- local size = #search_list
  -- -- Update search index
  -- if current_search_index == size then
    -- vim.b.search_index = 1
  -- else
    -- vim.b.search_index = current_search_index + 1
  -- end
  -- local selected_text = search_list[vim.b.search_index]
  -- -- Update hightlight text
  -- vim.api.nvim_feedkeys('/\\V' .. selected_text .. '\n', 'n', true)
-- end

-- Functions optimized for search navigation
function PreviousSearch()
  NavigateSearchList("previous")
end

function NextSearch()
  NavigateSearchList("next")
end

function ReplaceSelected()
  -- Get selected text
  local selected_text = vim.fn.getreg('a', 1)
  -- Get replacement text from user input
  local replacement_text = vim.fn.input('Replace with: ')
  -- Check if replacement text is empty
  if replacement_text == '' then
    return
  end
  -- Append replacement text into search list
  UpdateSearchList(replacement_text)
  -- Execute substitution command
  vim.cmd(':%s/' .. vim.fn.escape(selected_text, '/') .. '/' .. vim.fn.escape(replacement_text, '/') .. '/g')
end

