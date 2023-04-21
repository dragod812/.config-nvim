vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>n", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>p", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "g,", "<cmd>e ~/.config/nvim/lua/paddy/remap.lua<CR>");

-- resize buffers
vim.keymap.set("n", "<leader>-", "2<C-w><")
vim.keymap.set("n", "<leader>=", "2<C-w>>")
vim.keymap.set("n", "<leader>m", "<C-w>_<C-w>|")
vim.keymap.set("n", "<leader>M", "<C-w>=")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")


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
vim.keymap.set("n", "g<left>", "<C-w>h")
vim.keymap.set("n", "g<down>", "<C-w>j")
vim.keymap.set("n", "g<up>", "<C-w>k")
vim.keymap.set("n", "g<right>", "<C-w>l")

-- move editor windows
vim.keymap.set("n", "<leader><left>", "<C-w>H")
vim.keymap.set("n", "<leader><down>", "<C-w>J")
vim.keymap.set("n", "<leader><up>", "<C-w>K")
vim.keymap.set("n", "<leader><right>", "<C-w>L")

-- copy file path
vim.keymap.set("n", "<leader>C", ":let @+=expand('%:p')<CR>")
-- copy relative file path
vim.keymap.set("n", "<leader>c", "::let @+=expand('%', ':p:h:t')<CR>")

-- open current folder
vim.keymap.set("n", "gf", ":Ex<CR>")
