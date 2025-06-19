return {
  -- Extend DAP with a Docker debugpy config
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      -- Add a new optional configuration
      table.insert(dap.configurations.python, {
        name = "🐳 Attach to Python in Docker (debugpy)",
        type = "python",
        request = "attach",
        connect = {
          port = 5678,
          host = "127.0.0.1",
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(), -- Local project path
            remoteRoot = "/app", -- Path inside Docker
          },
        },
        mode = "remote",
        justMyCode = false,
      })
    end,
  },
}
