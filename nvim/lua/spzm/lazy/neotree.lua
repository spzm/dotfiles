return {
  "nvim-neo-tree/neo-tree.nvim",

  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },

  opts = {
    vim.keymap.set('n', '<leader>vv', ':Neotree toggle<CR>'),
    filesystem = {
      filtered_items = {
        visible = true, -- When true, they will just be displayed differently than normal items
        hide_dotfiles = false, -- Hide files that start with a dot
        hide_gitignored = false, -- Hide files that are gitignored
        hide_hidden = false, -- Hide files that are hidden (have names that start with a dot)
      },
      follow_current_file = {
        enabled = true, -- Focus the file that is currently being edited
      },
      use_libuv_file_watcher = true, -- Use the system file watcher to detect changes
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
