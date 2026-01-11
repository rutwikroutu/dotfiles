return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    }

    local builtin = require("telescope.builtin")

    -- Keybindings (leader = space)
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles,   { desc = "Recent files" })
  end,
}

