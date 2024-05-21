return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      require("lspconfig")["yamlls"].setup(cfg)
      require("telescope").load_extension("yaml_schema")
    end,
    opts = {
      -- schemas available in Telescope picker
      schemas = {},

      lspconfig = {
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },

            -- schemas from store, matched by filename
            -- loaded automatically
            schemas = {
              kubernetes = { "kubernetes/**/*.yaml", "kubernetes/**/*.yml" },
            },
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_z = {
        {
          function()
            local schema = require("yaml-companion").get_buf_schema(0)
            if schema.result[1].name == "none" then
              return ""
            end
            return schema.result[1].name
          end,
        },
        {
          function()
            return " " .. os.date("%R")
          end,
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>cy", "<cmd>Telescope yaml_schema<cr>", desc = "Select yaml schema" },
    },
  },
}
