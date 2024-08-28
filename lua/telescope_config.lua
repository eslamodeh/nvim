local telescope = require("telescope")
local actions = require("telescope.actions")

-- https://medium.com/@shaikzahid0713/telescope-333594836896
telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  defaults = {
    path_display = {
      "shorten"
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.toggle_selection,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default
      },
    },
  },
})

require('telescope').load_extension('fzf')
