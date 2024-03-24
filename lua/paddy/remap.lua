vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")
vim.keymap.set("n", "<leader>y", function()
	vim.cmd("OSCYankRegister *")
end)
vim.keymap.set("n", "<leader>r", vim.cmd.reg)

-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>j", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>k", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "g,", "<cmd>e ~/.config/nvim/lua/paddy/remap.lua<CR>")

-- resize buffers
vim.keymap.set("n", "<leader>-", "2<C-w><")
vim.keymap.set("n", "<leader>=", "2<C-w>>")
vim.keymap.set("n", "<leader>m", "<C-w>_<C-w>|")
vim.keymap.set("n", "<leader>M", "<C-w>=")
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>")

-- move between tabs
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<cr>")

-- move between splits
vim.keymap.set("n", "gh", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "gj", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "gk", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "gl", "<C-w>l", { noremap = true })

-- move editor windows
vim.keymap.set("n", "gH", "<C-w>H", { noremap = true, silent = true })
vim.keymap.set("n", "gJ", "<C-w>J", { noremap = true, silent = true })
vim.keymap.set("n", "gK", "<C-w>K", { noremap = true, silent = true })
vim.keymap.set("n", "gL", "<C-w>L", { noremap = true, silent = true })

-- copy file path
vim.keymap.set("n", "<leader>C", ":let @\"=expand('%:p')<CR>")
-- copy relative file path
vim.keymap.set("n", "<leader>c", ":let @\"=expand('%', ':p:h:t')<CR>")

-- open current folder
vim.keymap.set("n", "gf", ":Oil --float<CR>:set relativenumber<CR>")

-- open terminal in new tab
-- run <C-\><C-n> to enter normal mode to exit terminal
vim.keymap.set("n", "<leader>`", function()
	vim.cmd.terminal()
end)
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")

-- New file
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<leader>nx", ":new<CR>")
vim.keymap.set("n", "<leader>nv", ":vnew<CR>")
vim.keymap.set("n", "<leader>s", ":vsplit<CR><C-w>l")

-- write file
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":w<CR>")

-- execute file
vim.keymap.set({ "n" }, "<leader>de", ":!%<CR>")

-- format json
vim.keymap.set({ "n" }, "<leader>vjf", ":%! jq .<CR>")
vim.keymap.set({ "v" }, "<leader>vjf", ":'<,'>%! jq .<CR>")
vim.keymap.set(
	{ "v" },
	"<leader>vjc",
	":'<,'>%!jq 'del(.typeMeta, .metadata.creationTimestamp, .metadata.generateName, .metadata.selfLink, .metadata.annotations, .metadata.clusterName, .metadata.managedFields, .metadata.finalizers, .status.conditions, .metadata.labels.\"michelangelo/UpdateTimestamp\", .metadata.labels.\"michelangelo/SpecUpdateTimestamp\")'"
)
vim.keymap.set("n", "<leader>vju", ":%! jq -c '' | uniq -c", { noremap = true, silent = true })

-- vim vertical diff
vim.keymap.set({ "n" }, "<leader>v/", ":vert diffsplit ")

-- zenmode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- query replace command for mes
vim.keymap.set(
	"n",
	"<leader>vsc",
	[[:%s/sql_parameters.//ge<CR> :%s/{{project_meta_table}}/michelangelo.mes_project_meta/ge<CR> :%s/{{project_meta_v2_table}}/michelangelo.mes_project_meta_v2/ge<CR> :%s/{{model_meta_table}}/michelangelo.mes_model_meta/ge<CR> :%s/{{model_meta_v2_table}}/michelangelo.mes_model_meta_v2/ge<CR> :%s/{{metrics_table}}/michelangelo.mes_metrics/ge<CR> :%s/{{alert_configuration_table}}/michelangelo.mes_alert_configuration_meta/ge<CR> :%s/{{model_quality_score_table}}/michelangelo.mes_model_quality_score/ge<CR> :%s/{{pipeline_meta_table}}/michelangelo.mes_pipeline_meta/ge<CR>:%s/{{datestr}}/\=strftime('%Y-%m-%d', localtime()- 2*24*60*60)/ge<CR>]]
)
