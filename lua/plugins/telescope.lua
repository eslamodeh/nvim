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
      "smart"
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.toggle_selection,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-o>"] = function(p_bufnr) require("telescope.actions").send_selected_to_qflist(p_bufnr) vim.cmd.cfdo("edit") end,
        ["<CR>"] = actions.select_default
      },
    },
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        local is_image = function(filepath)
          local image_extensions = {'png','jpg'}   -- Supported image formats
          local split_path = vim.split(filepath:lower(), '.', {plain=true})
          local extension = split_path[#split_path]
          return vim.tbl_contains(image_extensions, extension)
        end
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _ )
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d..'\r\n')
            end
          end
          vim.fn.jobstart(
            {
              'catimg', filepath  -- Terminal image viewer command
            },
            {on_stdout=send_output, stdout_buffered=true, pty=true})
        else
          require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
        end
      end
    },
  },
})

require('telescope').load_extension('fzf')
