return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }
      local map = vim.keymap.set

      -- Add file
      map('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: add file' })

      -- Select marks 1-4
      map('n', '<C-h>', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: go to mark 1' })

      map('n', '<C-t>', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: go to mark 2' })

      map('n', '<C-n>', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: go to mark 3' })

      map('n', '<C-s>', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: go to mark 4' })

      -- Navigate marks
      map('n', '<leader>p', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon: previous mark' })

      map('n', '<leader>n', function()
        harpoon:list():next()
      end, { desc = 'Harpoon: next mark' })

      -- Remove current file
      map('n', '<leader>rd', function()
        harpoon:list():remove()
      end, { desc = 'Harpoon: remove current file' })

      -- Remove by slot number (1-4)
      for i = 1, 4 do
        map('n', '<leader>r' .. i, function()
          harpoon:list():remove_at(i)
        end, { desc = 'Harpoon: remove mark ' .. i })
      end

      -- Quick Menu & Telescope Logic
      local ok, telescope = pcall(require, 'telescope')
      if ok then
        pcall(telescope.load_extension, 'harpoon')
        local themes = require 'telescope.themes'
        map('n', '<C-e>', function()
          telescope.extensions.harpoon.marks(themes.get_ivy {})
        end, { desc = 'Harpoon: Telescope marks (ivy)' })
      else
        -- FIXED: Use harpoon.ui instead of separate ui module
        map('n', '<C-e>', function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoon: quick menu (fallback)' })
      end
    end,
  },
}
