return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Wichtige Library, ohne die geht nichts
    { 
      'nvim-telescope/telescope-fzf-native.nvim', 
      -- Damit die Suche pfeilschnell ist (kompiliert C-Code)
      build = 'make', 
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons' }, -- Schöne Icons
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            -- Im Insert-Mode (während du suchst):
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    })

    -- Lade die FZF-Erweiterung, falls sie kompiliert wurde
    pcall(require('telescope').load_extension, 'fzf')

    -- KEYMAPS direkt hier definieren
    local builtin = require 'telescope.builtin'
    
    -- 1. Dateien suchen (im aktuellen Ordner) -> Space + sf (Search Files)
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    
    -- 2. Text suchen (grep im ganzen Projekt) -> Space + sg (Search Grep)
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch [G]rep' })
    
    -- 3. Offene Buffer finden -> Space + Space
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    
    -- 4. Hilfe/Keymaps suchen -> Space + sh (Search Help)
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    
    -- 5. In aktueller Datei suchen -> Space + /
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })

    -- 6. Keymaps suchen -> Space + sk (Search Keymaps)
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  end,
}
