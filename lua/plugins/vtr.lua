return {
  {
    vim.keymap.set("n", "<F5>", function()
      local file = vim.fn.expand("%:p")
      local filetype = vim.bo.filetype

      -- Save the file
      vim.cmd("write")

      local runners = {
        python = "uv run",
        javascript = "node",
        typescript = "ts-node",
        sh = "bash",
        lua = "lua",
        go = "go run",
        rust = "cargo run",
      }

      local cmd = runners[filetype]
      if not cmd then
        vim.notify("No runner defined for filetype: " .. filetype, vim.log.levels.ERROR)
        return
      end

      -- Get current tmux pane ID (to return focus later)
      local cur_pane_handle = io.popen("tmux display-message -p '#{pane_id}'")
      local cur_pane = cur_pane_handle:read("*a"):gsub("\n", "")
      cur_pane_handle:close()

      -- Read stored runner pane ID
      local runner_pane_handle = io.popen("tmux show-option -gv '@nvim_runner_pane'")
      local runner_pane = runner_pane_handle:read("*a"):gsub("\n", "")
      runner_pane_handle:close()

      -- Validate: does the stored runner pane still exist?
      local function pane_exists(pane_id)
        local check = os.execute("tmux list-panes -F '#{pane_id}' | grep -q " .. pane_id)
        return check == 0
      end

      if runner_pane == "" or not pane_exists(runner_pane) then
        -- Create new pane and store its ID
        os.execute("tmux split-window -v -l 10")
        local id_handle = io.popen("tmux display-message -p '#{pane_id}'")
        runner_pane = id_handle:read("*a"):gsub("\n", "")
        id_handle:close()
        os.execute("tmux set-option -g '@nvim_runner_pane' " .. runner_pane)
      end

      -- Send run command to the runner pane
      local run_cmd = string.format("tmux send-keys -t %s '%s \"%s\"' C-m", runner_pane, cmd, file)
      os.execute(run_cmd)

      -- Return focus to the original pane
      os.execute("tmux select-pane -t " .. cur_pane)
    end, { desc = "Save and run current buffer in tmux runner pane" }),
  },
}
