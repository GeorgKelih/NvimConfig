return {
  "nvim-neotest/neotest",
  opts = {
    adapters = {
      ["neotest-python"] = {
        dap = { justMyCode = false },
        args = { "--capture=no" },
        pytest_discover_instances = true,
      },
    },
  },
}
