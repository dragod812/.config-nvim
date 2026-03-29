vim.keymap.set("n", "<leader>w", ":WhichKey<CR>", {})

local wk = require("which-key")

wk.setup({
	filter = function(mapping)
		return mapping.desc and mapping.desc ~= ""
	end,
})

wk.add({
	-- Top-level
	{ "<leader>a",      desc = "Harpoon Add" },
	{ "<leader>c",      desc = "Copy relative path" },
	{ "<leader>C",      desc = "Copy abs path" },
	{ "<leader>e",      desc = "Harpoon Edit" },
	{ "<leader>f",      desc = "Format" },
	{ "<leader>i",      desc = "Next Issue" },
	{ "<leader>I",      desc = "Prev Issue" },
	{ "<leader>j",      desc = "Quick Next" },
	{ "<leader>J",      desc = "Errors Next" },
	{ "<leader>k",      desc = "Quick Prev" },
	{ "<leader>K",      desc = "Errors Prev" },
	{ "<leader>m",      desc = "Maximize Buffer" },
	{ "<leader>M",      desc = "Equal Width" },
	{ "<leader>o",      desc = "Outline" },
	{ "<leader>r",      desc = "Run" },
	{ "<leader>s",      ":vsplit<CR><C-w>l", desc = "Split File" },
	{ "<leader>u",      desc = "Undo Tree" },
	{ "<leader>x",      desc = "File Explorer" },
	{ "<leader>z",      desc = "Zen Mode" },
	{ "<leader><leader>", desc = "Opened Buffers" },
	{ "<leader><CR>",   desc = "Find File" },

	-- Document group
	{ "<leader>d",      group = "Document" },
	{ "<leader>dc",     desc = "Classes" },
	{ "<leader>dm",     desc = "Methods" },
	{ "<leader>do",     desc = "Outline" },
	{ "<leader>ds",     desc = "Search" },
	{ "<leader>dv",     desc = "Variables" },

	-- Git group
	{ "<leader>g",      group = "Git" },
	{ "<leader>gb",     desc = "Blame" },
	{ "<leader>gc",     desc = "Checkout" },
	{ "<leader>gd",     desc = "Diff" },
	{ "<leader>gD",     desc = "Close Diff" },
	{ "<leader>gl",     desc = "Log" },
	{ "<leader>gp",     desc = "Pull" },
	{ "<leader>gP",     desc = "Push" },
	{ "<leader>gr",     desc = "Rebase" },
	{ "<leader>gs",     desc = "Status" },

	-- New File group
	{ "<leader>n",      group = "New File" },
	{ "<leader>nt",     "<cmd>tabnew<cr>", desc = "New Tab File" },
	{ "<leader>nx",     "<cmd>new<cr>",  desc = "New Horizontal File" },
	{ "<leader>nv",     "<cmd>vnew<cr>", desc = "New Vertical File" },

	-- Project group
	{ "<leader>p",      group = "Project" },
	{ "<leader>pf",     desc = "Files" },
	{ "<leader>pj",     desc = "Jumplist" },
	{ "<leader>pl",     desc = "Last Telescope Search" },
	{ "<leader>ps",     desc = "Search" },

	-- Test group
	{ "<leader>t",      group = "Test" },
	{ "<leader>tb",     desc = "Breakpoint" },
	{ "<leader>tc",     desc = "Continue" },
	{ "<leader>td",     group = "Debug Test" },
	{ "<leader>tdl",    desc = "Last Test" },
	{ "<leader>ts",     group = "Step" },
	{ "<leader>tsn",    desc = "Over" },
	{ "<leader>tsi",    desc = "Into" },
	{ "<leader>tso",    desc = "Out" },
	{ "<leader>tx",     desc = "Stop" },
	{ "<leader>tv",     desc = "View Variables" },

	-- Code Actions group
	{ "<leader>v",      group = "Code Actions" },
	{ "<leader>va",     desc = "Actions" },
	{ "<leader>vc",     desc = "Comment" },
	{ "<leader>vd",     desc = "Diagnostics" },
	{ "<leader>vi",     desc = "See Issue" },
	{ "<leader>vl",     desc = "LSP Restart" },
	{ "<leader>vr",     desc = "Rename" },
	{ "<leader>vt",     desc = "Generate Go Test" },
	{ "<leader>vj",     group = "JSON" },
	{ "<leader>vjf",    desc = "Format" },
	{ "<leader>vjc",    desc = "Clean" },
	{ "<leader>vju",    desc = "Count Unique" },
	{ "<leader>vs",     group = "SQL" },
	{ "<leader>vsf",    desc = "Format" },
	{ "<leader>vsc",    desc = "Clean" },
})
