return {
  {
    "xvzc/chezmoi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chezmoi").setup({
        -- your configurations
      })
      local telescope = require("telescope")
      telescope.load_extension("chezmoi")

      vim.keymap.set("n", "<leader>cz", telescope.extensions.chezmoi.find_files, { desc = "Search chezmoi files" })
    end,
  },
  {
    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
      -- add other options here if needed.
      require("nvim-treesitter.configs").setup({
        highlight = {
          disable = function()
            -- check if 'filetype' option includes 'chezmoitmpl'
            if string.find(vim.bo.filetype, "chezmoitmpl") then
              return true
            end
          end,
        },
      })
    end,
  },
}
