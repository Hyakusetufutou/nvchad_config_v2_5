require "nvchad.mappings"

-- add yours here

-- disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>wk")
nomap("n", "<leader>wK")
nomap("n", "<tab>")
nomap("n", "<S-tab>")

nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
nomap("t", "<ESC>")


local map = vim.keymap.set

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<Cmd>confirm q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<Cmd>confirm qall<CR>", { desc = "Quit" })
map("n", "]b", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "[b", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Telescope Git files" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "]g", function() require("gitsigns").next_hunk() end, { desc = "Next Git hunk" })
map("n", "[g", function() require("gitsigns").prev_hunk() end, { desc = "Previous Git hunk" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

