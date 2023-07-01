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
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\18openai_params\1\0\0\1\0\1\nmodel\23gpt-3.5-turbo-0301\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
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
  ["flash.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nflash\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/flash.nvim",
    url = "https://github.com/folke/flash.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\nl\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rdebugger\1\0\0\1\0\2\16run_via_dap\2\fenabled\2\nsetup\18flutter-tools\frequire\0" },
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
  neotest = {
    config = { "\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessageÄ\3\1\0\t\0\24\1,6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\22\0004\4\4\0006\5\v\0'\a\r\0B\5\2\2>\5\1\0046\5\v\0'\a\14\0B\5\2\0025\a\16\0005\b\15\0=\b\17\a5\b\18\0=\b\19\aB\5\2\2>\5\2\0046\5\v\0'\a\20\0B\5\2\0025\a\21\0B\5\2\0?\5\0\0=\4\23\3B\1\2\1K\0\1\0\radapters\1\0\0\1\0\2\fuse_lsp\2\fcommand\fflutter\17neotest-dart\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\2\vpython\21.venv/bin/python\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\15neotest-go\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\a€€À™\4\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-dart"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/neotest-dart",
    url = "https://github.com/sidlatau/neotest-dart"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
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
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\2\0\0\ngopls\nsetup\vdap-go\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/opt/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0?~/.local/share/nvim/mason/packages/debugpy/venv/bin/python\nsetup\15dap-python\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/opt/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\19remove_keymaps\1\2\0\0\6s\tview\1\0\0\1\0\2\19relativenumber\2\nwidth\b22%\nsetup\14nvim-tree\frequire\0" },
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
    config = { "\27LJ\2\n¨\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\nfloat\1\0\3\fpadding\3\2\15max_height\3(\14max_width\3d\1\0\1\26default_file_explorer\1\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["other.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\5\0\15\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0004\3\t\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\0035\4\6\0>\4\4\0035\4\a\0>\4\5\0035\4\b\0>\4\6\0035\4\t\0>\4\a\0035\4\n\0>\4\b\3=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\nstyle\1\0\4\14minHeight\3\2\vborder\nsolid\14seperator\6|\nwidth\4æÌ™³\6æÌ™ÿ\3\rmappings\1\0\0\1\0\3\fcontext\22open json request\fpattern\15(.*).json$\vtarget\n%1.sh\1\0\3\fcontext\21open sh response\fpattern\r(.*).sh$\vtarget\f%1.json\1\0\3\fcontext\rgototest\fpattern\20(.*)_test.dart$\vtarget\f%1.dart\1\0\3\fcontext\rgototest\fpattern\15(.*).dart$\vtarget\17%1_test.dart\1\0\3\fcontext\19pythongototest\fpattern\18(.*)_test.py$\vtarget\n%1.py\1\0\3\fcontext\19pythongototest\fpattern\r(.*).py$\vtarget\15%1_test.py\1\0\3\fcontext\rgototest\fpattern\18(.*)_test.go$\vtarget\n%1.go\1\0\3\fcontext\rgototest\fpattern\r(.*).go$\vtarget\15%1_test.go\nsetup\15other-nvim\frequire\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/other.nvim",
    url = "https://github.com/rgroli/other.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    config = { "\27LJ\2\nä\3\0\0\4\0\18\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0K\0\1\0\1\0\2\fpreview\t<F5>\frefresh\t<F6>\30plantuml_preview_mappings\19-charset UTF-8\26plantuml_preview_args\rplantuml\25plantuml_preview_cmd\bdot\25plantuml_preview_dot2plantuml_preview_open_output_file_auto_delete&plantuml_preview_open_output_file\22~/.cache/plantuml\vexpand\afn&plantuml_preview_output_directory\bpng\"plantuml_preview_image_format\6g\bvim\0" },
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim",
    url = "https://github.com/weirongxu/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nŽ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\26show_relative_numbers\2\17show_numbers\2\16show_guides\2\27highlight_hovered_item\2\nsetup\20symbols-outline\frequire\0" },
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
  ["vim-bazel"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-bazel",
    url = "https://github.com/bazelbuild/vim-bazel"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maktaba"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-maktaba",
    url = "https://github.com/google/vim-maktaba"
  },
  ["vim-oscyank"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-oscyank",
    url = "https://github.com/ojroques/vim-oscyank"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/sidharthpadhee/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: plantuml-previewer.vim
time([[Config for plantuml-previewer.vim]], true)
try_loadstring("\27LJ\2\nä\3\0\0\4\0\18\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0K\0\1\0\1\0\2\fpreview\t<F5>\frefresh\t<F6>\30plantuml_preview_mappings\19-charset UTF-8\26plantuml_preview_args\rplantuml\25plantuml_preview_cmd\bdot\25plantuml_preview_dot2plantuml_preview_open_output_file_auto_delete&plantuml_preview_open_output_file\22~/.cache/plantuml\vexpand\afn&plantuml_preview_output_directory\bpng\"plantuml_preview_image_format\6g\bvim\0", "config", "plantuml-previewer.vim")
time([[Config for plantuml-previewer.vim]], false)
-- Config for: other.nvim
time([[Config for other.nvim]], true)
try_loadstring("\27LJ\2\n®\5\0\0\5\0\15\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0004\3\t\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\0035\4\6\0>\4\4\0035\4\a\0>\4\5\0035\4\b\0>\4\6\0035\4\t\0>\4\a\0035\4\n\0>\4\b\3=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\nstyle\1\0\4\14minHeight\3\2\vborder\nsolid\14seperator\6|\nwidth\4æÌ™³\6æÌ™ÿ\3\rmappings\1\0\0\1\0\3\fcontext\22open json request\fpattern\15(.*).json$\vtarget\n%1.sh\1\0\3\fcontext\21open sh response\fpattern\r(.*).sh$\vtarget\f%1.json\1\0\3\fcontext\rgototest\fpattern\20(.*)_test.dart$\vtarget\f%1.dart\1\0\3\fcontext\rgototest\fpattern\15(.*).dart$\vtarget\17%1_test.dart\1\0\3\fcontext\19pythongototest\fpattern\18(.*)_test.py$\vtarget\n%1.py\1\0\3\fcontext\19pythongototest\fpattern\r(.*).py$\vtarget\15%1_test.py\1\0\3\fcontext\rgototest\fpattern\18(.*)_test.go$\vtarget\n%1.go\1\0\3\fcontext\rgototest\fpattern\r(.*).go$\vtarget\15%1_test.go\nsetup\15other-nvim\frequire\0", "config", "other.nvim")
time([[Config for other.nvim]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rdebugger\1\0\0\1\0\2\16run_via_dap\2\fenabled\2\nsetup\18flutter-tools\frequire\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\18openai_params\1\0\0\1\0\1\nmodel\23gpt-3.5-turbo-0301\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nŽ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\26show_relative_numbers\2\17show_numbers\2\16show_guides\2\27highlight_hovered_item\2\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n|\0\1\6\0\b\0\0229\1\0\0\18\3\1\0009\1\1\1'\4\2\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\4\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\5\0'\5\3\0B\1\4\2\18\3\1\0009\1\1\1'\4\6\0'\5\a\0B\1\4\2L\1\2\0\5\t^%s+\b%s+\6\t\6 \6\n\tgsub\fmessageÄ\3\1\0\t\0\24\1,6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\4\0019\1\5\0015\3\t\0005\4\a\0003\5\6\0=\5\b\4=\4\n\3\18\4\0\0B\1\3\0016\1\v\0'\3\3\0B\1\2\0029\1\f\0015\3\22\0004\4\4\0006\5\v\0'\a\r\0B\5\2\2>\5\1\0046\5\v\0'\a\14\0B\5\2\0025\a\16\0005\b\15\0=\b\17\a5\b\18\0=\b\19\aB\5\2\2>\5\2\0046\5\v\0'\a\20\0B\5\2\0025\a\21\0B\5\2\0?\5\0\0=\4\23\3B\1\2\1K\0\1\0\radapters\1\0\0\1\0\2\fuse_lsp\2\fcommand\fflutter\17neotest-dart\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\2\vpython\21.venv/bin/python\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\15neotest-go\nsetup\frequire\17virtual_text\1\0\0\vformat\1\0\0\0\vconfig\15diagnostic\fneotest\26nvim_create_namespace\bapi\bvim\a€€À™\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17view_options\1\0\1\16show_hidden\2\nfloat\1\0\3\fpadding\3\2\15max_height\3(\14max_width\3d\1\0\1\26default_file_explorer\1\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n…\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\19remove_keymaps\1\2\0\0\6s\tview\1\0\0\1\0\2\19relativenumber\2\nwidth\b22%\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: flash.nvim
time([[Config for flash.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nflash\frequire\0", "config", "flash.nvim")
time([[Config for flash.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-dap-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-dap-python'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

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
