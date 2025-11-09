---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "EdenEast/nightfox.nvim" },
  { "mbbill/undotree" },
  { "peterhoeg/vim-qml", event = "BufRead", ft = { "qml" } },
  { "p00f/clangd_extensions.nvim" },
  --  { 'echasnovski/mini.nvim',      version = '*' },
  -- { "nvim-tree/nvim-web-devicons" },
  -- Makes problems with 's' shortkey:
  -- { "ntpeters/vim-better-whitespace" },
  -- { "cappyzawa/trim.nvim" },
  { "CoatiSoftware/vim-sourcetrail" },

  --{
  --  "Exafunction/windsurf.nvim",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "hrsh7th/nvim-cmp",
  --  },
  --  config = function() require("codeium").setup {} end,
  --},

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "",
            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          }, "\n"),

          --            "",
          --            "███    ██ ██    ██ ██ ███    ███",
          --            "████   ██ ██    ██ ██ ████  ████",
          --            "██ ██  ██ ██    ██ ██ ██ ████ ██",
          --            "██  ██ ██  ██  ██  ██ ██  ██  ██",
          --            "██   ████   ████   ██ ██      ██",
          --          }, "\n"),
        },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      default = {
        directory = { glyph = "" },
      },
      directory = {
        tests = { glyph = "" },
      },
      filetype = {
        cpp = { glyph = "" },
        txt = { glyph = "" },
        cmake = { glyph = "" },
      },
      extension = {
        hpp = { glyph = "" },
        qml = { glyph = "" },
        ts = { glyph = "" },
      },
      lsp = {
        array = { glyph = "" },
        boolean = { glyph = "" },
        key = { glyph = "" },
        namespace = { glyph = "" },
        null = { glyph = "" },
        number = { glyph = "" },
        object = { glyph = "" },
        package = { glyph = "" },
        string = { glyph = "" },
        class = { glyph = "" },
        color = { glyph = "" },
        constant = { glyph = "" },
        constructor = { glyph = "" },
        enum = { glyph = "" },
        enummember = { glyph = "" },
        event = { glyph = "" },
        field = { glyph = "" },
        file = { glyph = "" },
        folder = { glyph = "" },
        ["function"] = { glyph = "" },
        interface = { glyph = "" },
        keyword = { glyph = "" },
        method = { glyph = "" },
        module = { glyph = "" },
        operator = { glyph = "" },
        property = { glyph = "" },
        reference = { glyph = "" },
        snippet = { glyph = "" },
        struct = { glyph = "" },
        text = { glyph = "" },
        typeparameter = { glyph = "" },
        unit = { glyph = "" },
        value = { glyph = "" },
        variable = { glyph = "" },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
