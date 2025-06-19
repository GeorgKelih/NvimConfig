-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode (esc)" })

-- Debug keymaps

vim.keymap.set("n", "<F6>", function()
  require("dap").continue()
end, { desc = " Debug: Start/Continue" })
vim.keymap.set("n", "<F7>", function()
  require("dap").step_over()
end, { desc = " Debug: Step Over" })
vim.keymap.set("n", "<F8>", function()
  require("dap").step_into()
end, { desc = " Debug: Step Into" })
vim.keymap.set("n", "<F9>", function()
  require("dap").step_out()
end, { desc = " Debug: Step Out" })
