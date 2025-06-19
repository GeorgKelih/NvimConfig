return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", mode = { "n", "i", "v" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", mode = { "n", "i", "v" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", mode = { "n", "i", "v" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", mode = { "n", "i", "v" } },
  },
}
