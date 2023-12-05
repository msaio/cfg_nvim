local plugins = {
    "coc-clangd",
    "coc-go",
    "coc-html",
    "coc-json",
    "coc-lua",
    "coc-prettier",
    "coc-pyright",
    "coc-sh",
    "coc-snippets",
    "coc-solargraph",
    "coc-sql",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-xml",
    "coc-yaml"
}

-- Function to execute a single CocInstall command for all plugins
local function installAllCocPlugins()
    local pluginString = table.concat(plugins, " ")
    local command = "CocInstall " .. pluginString
    vim.api.nvim_command(command)
end

-- Call the function to install all plugins at once
installAllCocPlugins()
