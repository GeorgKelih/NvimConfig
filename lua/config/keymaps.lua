-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode (esc)" })

vim.keymap.set("n", "<leader>r", function()
  -- Save the current file
  vim.cmd("w")

  -- Move to the split below (assuming it's a terminal)
  vim.cmd("wincmd j")

  -- Send Up + Enter to terminal to run last command
  -- Must be sent as terminal input
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Up><CR>", true, false, true), "t", false)

  -- Delay slightly to allow command to run before switching
  vim.defer_fn(function()
    -- Move back to the original window
    vim.cmd("wincmd k")
  end, 100) -- 100 ms delay
end, { desc = "Save, run last terminal command" })
