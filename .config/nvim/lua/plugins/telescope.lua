local telescope = require('telescope')

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
    extensions = {
        project = {
            base_dirs = {
                { '~/Projects/', max_depth = 2 },
            },
            hidden_files = true, -- default: false
        },
        file_browser = {
            theme = "ivy",
            grouped = true,
            -- disables netrw and use telescope-file-browser in its place
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
    },
  }
}


-- TODO: builtins.lsp

-- Extensions

telescope.load_extension 'project'

telescope.load_extension 'neoclip'
telescope.load_extension 'file_browser'
