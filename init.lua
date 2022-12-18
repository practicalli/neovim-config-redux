-- Neovim configuration Entrypoint
-- Bootstrap packer package manager
-- Aniseed compiles and loads fnl/config/init.fnl and required namespaces

-- nvim_tree: disable netrw at the very start of init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local execute = vim.api.nvim_command
local fn = vim.fn

-- Language providers
-- https://practical.li/neovim/reference/neovim/language-providers/
-- Uncomment to disable a specific provider
-- vim.g.loaded_node_provider = 0
-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_ruby_provider = 0

-- Packer configuration
local pack_path = fn.stdpath("data") .. "/site/pack"
local fmt = string.format

function ensure (user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {
  module = "config.init",
  compile = true
}
