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

  -- Telescope overrides (Find Plugin File keymap) - FIXED
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
  -- 📝 MARKDOWN PREVIEW (Self-contained with filetype fix) - FIXED
  -- ==========================================
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 100, -- Fixed typo: was 109
        height = 30,
        width_ratio = 0.7, -- Fixed typo: was width_patio
        height_ratio = 0.6, -- Fixed typo: was height_patio
        border = "shadow",
      })
    end,
    cmd = "Glow", -- Fixed: was end = "glow"
    init = function()
      -- Filetype recognition specifically for glow - FIXED
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { -- Fixed syntax
        pattern = "*.md",
        callback = function()
          vim.bo.filetype = "markdown" -- Fixed: removed | character
        end,
      })

      vim.keymap.set("n", "<leader>mp", function() -- Fixed: was "\n" and "<Leader>mp"
        if vim.fn.expand("%:e") == "md" then
          vim.cmd("Glow") -- Fixed: was "GLow"
        else
          print("Not a .md file - current extension: " .. vim.fn.expand("%:e")) -- Fixed: was ... instead of ..
        end
      end, { desc = "Markdown Preview" }) -- Fixed: removed extra space and fixed bracket
    end,
  },

  -- ==========================================
  -- 🧠 CODING & PARSING
  -- ==========================================

  -- Completion: Add Emoji support - FIXED
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" }, -- Fixed: was "cmp-enoji"
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" }) -- Fixed: was "enoji"
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
