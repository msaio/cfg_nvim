local vim_version = tostring(vim.version())
if string.find(vim_version, "table") then
	vim.cmd([[
		source ~/.config/nvim/old_school/init.vim
	]])
else
	-- bootstrap lazy.nvim, LazyVim and your plugins
	require("config.lazy")
end
