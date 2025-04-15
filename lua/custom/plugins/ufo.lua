-- -- lua/custom/folding.lua
-- local M = {}
--
-- M.setup = function()
--   -- Set folding options
--   vim.o.foldcolumn = '1'
--   vim.o.foldlevel = 99
--   vim.o.foldlevelstart = 99
--   vim.o.foldenable = true
--
--   -- Setup nvim-ufo
--   require('ufo').setup {
--     provider_selector = function(bufnr, filetype, buftype)
--       return { 'lsp', 'indent' } -- Use LSP first, then indent as fallback
--     end,
--   }
--
--   -- Add keymaps for folding
--   vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
--   vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
--   -- Add any other folding-related keymaps you want
-- end
--
-- return M

return {
  {
    --enable = True,
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    -- config = function()
    --   vim.o.foldcolumn = '1' -- '0' is not bad
    --   vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    --   vim.o.foldlevelstart = 99
    --   vim.o.foldenable = true
    --   vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    --   vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    -- end,
    event = 'BufReadPost',
    opts = {
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end,
    },
    init = function()
      vim.keymap.set('n', 'zR', function()
        require('ufo').openAllFolds()
      end)
      vim.keymap.set('n', 'zM', function()
        require('ufo').closeAllFolds()
      end)
    end,
  },
}
