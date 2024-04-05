return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  }, 
  {
    "hadronized/hop.nvim",
    opts = {},
    keys = {
      {
        "t",
        function() require("hop").hint_words() end,
        mode = { "n", "v" },
        desc = "Hop hint words",
      },
      {
        "T",
        function() require("hop").hint_lines() end,
        mode = { "n", "v" },
        desc = "Hop hint lines",
      },
      {
        "f",
        function() require("hop").hint_char1() end,
        mode = { "n", "v" },
        desc = "Hop hint one char",
      },
      {
        "F",
        function()
          require("hop").hint_char1(
            {
              current_line_only = true,
              -- direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            }
          )
        end,
        mode = { "n", "v" },
        desc = "Hop hint vertical",
      },
      -- {
      --   "f",
      --   function() require("hop").hint_words { extend_visual = true } end,
      --   mode = { "v" },
      --   desc = "Hop hint words",
      -- },
      -- {
      --   "F",
      --   function() require("hop").hint_lines { extend_visual = true } end,
      --   mode = { "v" },
      --   desc = "Hop hint lines",
      -- },
    },
  },
}
