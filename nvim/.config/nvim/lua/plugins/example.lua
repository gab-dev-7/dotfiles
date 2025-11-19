return {
  -- ==========================================
  -- 🎨 THEMES & UI (Pywal Support)
  -- ==========================================
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to load the 'neopywal' colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neopywal",
    },
  },

  -- Disable the alpha dashboard (optional)
  { "folke/alpha-nvim", enabled = false },

  -- Lualine customization (Merged into one block)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Add emoji to lualine
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- ==========================================
  -- 🔧 EDITOR TOOLS
  -- ==========================================

  -- Trouble configuration (Disabled as per your previous file)
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    enabled = false,
  },

  -- Telescope overrides (Find Plugin File keymap)
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- ==========================================
  -- 🧠 CODING & PARSING
  -- ==========================================

  -- Completion: Add Emoji support
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Treesitter: Ensure syntax highlighters are installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "c",
        "cpp",
      })
    end,
  },

  -- Mason: Ensure external tools are installed
  -- ✅ UPDATED: Using the new 'mason-org' name to fix the warning
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "codelldb", -- C/C++ Debugger
      })
    end,
  },
}
