vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
vim.keymap.set('v', '<leader>y', '<Plug>OSCYankVisual')
vim.keymap.set('n', '<leader>y', function()
    vim.cmd('OSCYankRegister *')
end)
vim.keymap.set("n", "<leader>r", vim.cmd.reg)

-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>j", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>k", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "g,", "<cmd>e ~/.config/nvim/lua/paddy/remap.lua<CR>");

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
vim.keymap.set("n", "<leader>c", "::let @\"=expand('%', ':p:h:t')<CR>")

-- open current folder
vim.keymap.set("n", "gf", ":Oil --float<CR>")

-- open terminal in new tab
-- run <C-\><C-n> to enter normal mode to exit terminal
vim.keymap.set("n", "<leader>`", function()
    vim.cmd.terminal()
    vim.cmd.file('term://zsh')
end)

-- open new tab
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")

-- open new split
vim.keymap.set("n", "<leader>s", ":vsplit<CR><C-w>l")

-- write file
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":w<CR>")
