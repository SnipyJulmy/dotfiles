return {
  {
    "eandrju/cellular-automaton.nvim",
    config = function()
      vim.keymap.set("n", "<leader>ca", "<cmd>CellularAutomaton game_of_life<CR>")
    end,
  },
}
