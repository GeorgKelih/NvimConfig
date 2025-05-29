return {
  {
    "saghen/blink.cmp", -- Or "hrsh7th/nvim-cmp" if you're using that instead
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab",
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = { "select_prev" },
      }
      -- If you also want to use Tab to expand/jump through snippets,
      -- you might need more advanced mapping.
      -- Here's a more comprehensive example from a Reddit discussion for nvim-cmp:
      -- if opts.keymap["<Tab>"] then
      --   if opts.keymap.preset == "super-tab" then
      --     -- super-tab
      --     opts.keymap["<Tab>"] = {
      --       require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
      --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
      --     }
      --   end
      -- end
    end,
  },
}
