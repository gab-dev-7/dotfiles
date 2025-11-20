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

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neopywal",
    },
  },

  { "folke/alpha-nvim", enabled = false },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
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

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    enabled = false,
  },

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
  -- 📝 MARKDOWN PREVIEW
  -- ==========================================
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 100,
        height = 30,
        width_ratio = 0.7,
        height_ratio = 0.6,
        border = "shadow",
      })
    end,
    cmd = "Glow",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.md",
        callback = function()
          vim.bo.filetype = "markdown"
        end,
      })

      vim.keymap.set("n", "<leader>mp", function()
        if vim.fn.expand("%:e") == "md" then
          vim.cmd("Glow")
        else
          print("Not a .md file - current extension: " .. vim.fn.expand("%:e"))
        end
      end, { desc = "Markdown Preview" })
    end,
  },

  -- ==========================================
  -- 🧠 CODING & PARSING
  -- ==========================================

  -- ⚠️ NEW: Fix for Java "Non-Project File" Warning
  -- This tells the LSP to look for .iml or .git to determine the root
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              ".git", -- Look for Git root (Best for GitLab projects)
              "*.iml", -- Look for IntelliJ idea files (Uni projects)
              "mvnw", -- Maven
              "gradlew", -- Gradle
              "pom.xml",
              "build.gradle"
            )(fname) or vim.fn.getcwd()
          end,
        },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

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

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "codelldb",
        "jdtls", -- Ensure Java Language Server is actually installed
      })
    end,
  },
}
