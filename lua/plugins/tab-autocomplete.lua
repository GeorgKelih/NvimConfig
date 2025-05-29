return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab", -- This preset should handle fallback intelligently
        -- If "super-tab" isn't behaving as expected for fallback,
        -- you might need to define the Tab mapping explicitly and use its fallback mechanism.
        -- ["<Tab>"] = function(cmp)
        --   if cmp.visible() then
        --     return cmp.select_and_accept() -- or just select_next/accept
        --   elseif cmp.snippet_active() then
        --     return cmp.snippet_forward()
        --   elseif --[[ some condition like has_words_before() adapted for blink.cmp ]] then
        --     return cmp.complete()
        --   else
        --     return cmp.fallback() -- blink.cmp should also have a fallback mechanism
        --   end
        -- end,
      }
      return opts
    end,
  },
}
