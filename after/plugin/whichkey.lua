vim.keymap.set("n", "<leader>w", "<cmd>WhichKey<CR>")

local wk = require("which-key")

wk.setup({
	filter = function(mapping)
		return mapping.desc and mapping.desc ~= ""
	end,
})

wk.add({
	-- Top-level
	{ "<leader>a", desc = "Harpoon Add" },
	{ "<leader>c", desc = "Copy relative path" },
	{ "<leader>C", desc = "Copy abs path" },
	{ "<leader>e", desc = "Harpoon Edit" },
	{ "<leader>f", desc = "Format" },
	{ "<leader>i", desc = "Next Diagnostic" },
	{ "<leader>I", desc = "Prev Diagnostic" },
	{ "<leader>j", desc = "Quickfix Next" },
	{ "<leader>J", desc = "Loclist Next" },
	{ "<leader>k", desc = "Quickfix Prev" },
	{ "<leader>K", desc = "Loclist Prev" },
	{ "<leader>m", desc = "Maximize Buffer" },
	{ "<leader>M", desc = "Equal Width" },
	{ "<leader>o", desc = "Outline" },
	{ "<leader>r", desc = "Registers" },
	{ "<leader>s", desc = "Split Vertical" },
	{ "<leader>u", desc = "Undo Tree" },
	{ "<leader>x", desc = "File Explorer" },
	{ "<leader>z", desc = "Zen Mode" },
	{ "<leader>?", desc = "ChatGPT" },
	{ "<leader>`", desc = "Terminal" },
	{ "<leader><leader>", desc = "Opened Buffers" },
	{ "<leader><CR>", desc = "Find File" },

	-- Document group
	{ "<leader>d", group = "Document" },
	{ "<leader>dc", desc = "Classes" },
	{ "<leader>dm", desc = "Methods" },
	{ "<leader>do", desc = "Symbols" },
	{ "<leader>ds", desc = "Search" },
	{ "<leader>dv", desc = "Variables" },

	-- Git group
	{ "<leader>g", group = "Git" },
	{ "<leader>g=", desc = "Stage All" },
	{ "<leader>g-", desc = "Unstage All" },
	{ "<leader>gb", desc = "Blame" },
	{ "<leader>gc", desc = "Checkout" },
	{ "<leader>gd", desc = "Diff Split" },
	{ "<leader>gD", desc = "Close Diff" },
	{ "<leader>gf", desc = "File Log" },
	{ "<leader>gl", desc = "Log" },
	{ "<leader>gM", desc = "Diff Main" },
	{ "<leader>gp", desc = "Pull" },
	{ "<leader>gP", desc = "Push" },
	{ "<leader>gr", desc = "Rebase" },
	{ "<leader>gs", desc = "Status" },
	{ "<leader>gz", group = "Stash" },
	{ "<leader>gz0", desc = "Apply stash@{0}" },
	{ "<leader>gz1", desc = "Apply stash@{1}" },
	{ "<leader>gz2", desc = "Apply stash@{2}" },

	-- New File group
	{ "<leader>n", group = "New File" },
	{ "<leader>nt", desc = "New Tab" },
	{ "<leader>nx", desc = "New Horizontal" },
	{ "<leader>nv", desc = "New Vertical" },

	-- Project group
	{ "<leader>p", group = "Project" },
	{ "<leader>pf", desc = "Files" },
	{ "<leader>pj", desc = "Jumplist" },
	{ "<leader>pl", desc = "Resume Last Search" },
	{ "<leader>po", desc = "Workspace Symbols" },
	{ "<leader>pr", desc = "Recent Files" },
	{ "<leader>ps", desc = "Grep" },
	{ "<leader>pm", desc = "Workspace Methods" },
	{ "<leader>pv", desc = "Workspace Variables" },
	{ "<leader>pc", desc = "Workspace Classes" },

	-- Test & Debug group
	{ "<leader>t", group = "Test/Debug" },
	{ "<leader>tr", desc = "Run Nearest" },
	{ "<leader>tf", desc = "Run File" },
	{ "<leader>to", desc = "Output" },
	{ "<leader>tO", desc = "Output Panel" },
	{ "<leader>tb", desc = "Breakpoint" },
	{ "<leader>tc", desc = "Continue" },
	{ "<leader>td", group = "Debug Test" },
	{ "<leader>tdg", desc = "Go" },
	{ "<leader>tdp", desc = "Python" },
	{ "<leader>tdl", desc = "Last" },
	{ "<leader>ts", group = "Step" },
	{ "<leader>tsn", desc = "Over" },
	{ "<leader>tsi", desc = "Into" },
	{ "<leader>tso", desc = "Out" },
	{ "<leader>tx", desc = "Stop" },
	{ "<leader>tv", desc = "Variables" },

	-- Code Actions group
	{ "<leader>v", group = "Code Actions" },
	{ "<leader>va", desc = "Actions" },
	{ "<leader>vd", desc = "Diagnostics (loclist)" },
	{ "<leader>vi", desc = "Diagnostic Float" },
	{ "<leader>vl", desc = "LSP Restart" },
	{ "<leader>vr", desc = "Rename" },
	{ "<leader>vt", desc = "Generate Go Test" },
	{ "<leader>v/", desc = "Diff Split" },
	{ "<leader>vj", group = "JSON" },
	{ "<leader>vjf", desc = "Format" },
	{ "<leader>vjc", desc = "Clean K8s" },
	{ "<leader>vju", desc = "Count Unique" },
	{ "<leader>vs", group = "SQL" },
	{ "<leader>vsc", desc = "Expand Templates" },
})
