return {
  {
    "esensar/nvim-dev-container",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- nvim-dev-container requires nvim-treesitter
    opts = {
      -- You can add any custom options for nvim-dev-container here.
      -- For example, to enable automatic startup of devcontainers:
      auto_update = true,
      auto_remove = true,
      -- For a full list of options, refer to the plugin's GitHub page:
      -- https://github.com/esensar/nvim-dev-container
    },
    config = function(_, opts)
      require("devcontainer").setup(opts)
    end,
  },
}
