
---@type LazySpec

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- basic config from https://github.com/ThePrimeagen/harpoon/tree/harpoon2
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>A', function()
        harpoon:list():remove()
      end)
      vim.keymap.set('n', '<C-7>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- Ctrl + [h,j,k,l] to move to mark [1,2,3,4] --
      vim.keymap.set('n', '<C-1>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-2>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-3>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-4>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)

      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-7>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  }
}





--return {
--    "ThePrimeagen/harpoon",
--    branch = "harpoon2",
--    dependencies = { "nvim-lua/plenary.nvim" },
--    config = function() require("harpoon").setup() end,

--    ["<Leader>a"] = { require("harpoon.mark").add_file, desc = "Add file to harpoon" },

    --["<Leader>a"] = { require("harpoon.mark").add_file, desc = "Add file to harpoon" },
    --["<C-7>"] = { require("harpoon.ui").toggle_quick_menu },
    --["<C-1>"] = { function() require("harpoon.ui").nav_file(1) end },
    --["<C-2>"] = { function() require("harpoon.ui").nav_file(2) end },
    --["<C-3>"] = { function() require("harpoon.ui").nav_file(3) end },
    --["<C-4>"] = { function() require("harpoon.ui").nav_file(4) end },
    -- require("harpoon").setup(),
--},
--}
