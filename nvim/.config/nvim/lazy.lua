require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- ALL 'extras' plugins must go here, BEFORE your user plugins
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- This line imports all your files from ~/.config/nvim/lua/plugins/
    { import = "plugins" },
  },
  -- ... your other lazy.setup config ...
})
