local map = vim.keymap.set
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)
map("n", "<A-k>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")

map("n", "<A-m>", function()
  require("harpoon.ui").toggle_quick_menu()
end)
map("n", "<A-a>", function()
  require("harpoon.mark").add_file()
end)
map("n", "<A-,>", function()
  require("harpoon.ui").nav_next()
end)
map("n", "<A-f>", "<cmd>:Format<cr>")
map('n', "<F9>", "<cmd>:!g++ % -o %< <cr>")
map('n', "<F7>", "<cmd>:!gcc % -o %< <cr>")
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept('\<CR>')]]
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n","<A-Up>", "<cmd>TmuxNavigateUp<CR>")
map("n","<A-Right>", "<cmd>TmuxNavigateRight<CR>")
map("n","<A-Left>", "<cmd>TmuxNavigatePrevious<CR>")
