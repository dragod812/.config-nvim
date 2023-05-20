-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/sidharthpadhee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/sidharthpadhee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/sidharthpadhee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/sidharthpadhee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/sidharthpadhee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\na\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\18openai_params\1\0\0\1\0\1\nmodel\ngpt-4\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cobalt2.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/cobalt2.nvim",
    url = "https://github.com/lalitmee/cobalt2.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["gounit-vim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/gounit-vim",
    url = "https://github.com/hexdigest/gounit-vim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\"asdfghjkl;zxcvbnm,.qwertyuiop\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\0\1\0\2\19relativenumber\2\nwidth\b20%\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\3\15max_height\3(\14max_width\3d\fpadding\3\2\1\0\1\26default_file_explorer\1\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["other.nvim"] = {
    config = { "\27LJ\2\n™\4\0\0\5\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\a\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\0035\4\6\0>\4\4\0035\4\a\0>\4\5\0035\4\b\0>\4\6\3=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\nstyle\1\0\4\nwidth\4æÌ™³\6æÌ™ÿ\3\vborder\nsolid\14minHeight\3\2\14seperator\6|\rmappings\1\0\0\1\0\3\vtarget\f%1.dart\fcontext\rgototest\fpattern\20(.*)_test.dart$\1\0\3\vtarget\17%1_test.dart\fcontext\rgototest\fpattern\15(.*).dart$\1\0\3\vtarget\n%1.py\fcontext\rgototest\fpattern\18(.*)_test.py$\1\0\3\vtarget\15%1_test.py\fcontext\rgototest\fpattern\r(.*).py$\1\0\3\vtarget\n%1.go\fcontext\rgototest\fpattern\18(.*)_test.go$\1\0\3\vtarget\15%1_test.go\fcontext\rgototest\fpattern\r(.*).go$\nsetup\15other-nvim\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/other.nvim",
    url = "https://github.com/rgroli/other.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nŽ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\17show_numbers\2\16show_guides\2\27highlight_hovered_item\2\26show_relative_numbers\2\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  treesj = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  undotree = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-oscyank"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-oscyank",
    url = "https://github.com/ojroques/vim-oscyank"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nŽ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\17show_numbers\2\16show_guides\2\27highlight_hovered_item\2\26show_relative_numbers\2\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nfloat\1\0\3\15max_height\3(\14max_width\3d\fpadding\3\2\1\0\1\26default_file_explorer\1\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\na\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\18openai_params\1\0\0\1\0\1\nmodel\ngpt-4\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\0\1\0\2\19relativenumber\2\nwidth\b20%\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\"asdfghjkl;zxcvbnm,.qwertyuiop\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: other.nvim
time([[Config for other.nvim]], true)
try_loadstring("\27LJ\2\n™\4\0\0\5\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\a\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\0035\4\6\0>\4\4\0035\4\a\0>\4\5\0035\4\b\0>\4\6\3=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\nstyle\1\0\4\nwidth\4æÌ™³\6æÌ™ÿ\3\vborder\nsolid\14minHeight\3\2\14seperator\6|\rmappings\1\0\0\1\0\3\vtarget\f%1.dart\fcontext\rgototest\fpattern\20(.*)_test.dart$\1\0\3\vtarget\17%1_test.dart\fcontext\rgototest\fpattern\15(.*).dart$\1\0\3\vtarget\n%1.py\fcontext\rgototest\fpattern\18(.*)_test.py$\1\0\3\vtarget\15%1_test.py\fcontext\rgototest\fpattern\r(.*).py$\1\0\3\vtarget\n%1.go\fcontext\rgototest\fpattern\18(.*)_test.go$\1\0\3\vtarget\15%1_test.go\fcontext\rgototest\fpattern\r(.*).go$\nsetup\15other-nvim\frequire\0", "config", "other.nvim")
time([[Config for other.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
