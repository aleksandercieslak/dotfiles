vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, {})
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, {})
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, {})
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, {})
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").grep_string() end, {})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {})

vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, {})
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, {})

vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local file = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local cmd = "g++ -std=c++17 -O2 -Wall -Wextra -Wshadow -fsanitize=address,undefined -DLOCAL " .. file .. " -o " .. out .. " && " .. out
  require("toggleterm").exec(cmd)
end, {})

vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end, {})
vim.keymap.set("n", "<F6>", function() require("dap").continue() end, {})
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, {})
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, {})
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, {})
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, {})

vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<CR>", {})

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {})

vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, {})
