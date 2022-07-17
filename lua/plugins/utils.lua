require("lfs")
-- Para nvim-web-devicons
require'nvim-web-devicons'.get_icons()
require'colorizer'.setup()
require("bufferline").setup{}

require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})
require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
  },
}


local function dot_git_exists()
  local path = "./.git"
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

if dot_git_exists() then
  branch = '-branch'
else 
  branch = '-📁'
  --branch = '-  '
end

local function get_var(my_var_name)
  return vim.api.nvim_get_var(my_var_name)
end

extension = get_var("extension")

if extension == "cpp" or extension == "hpp" or extension == "h" then
  this_lsp = '-lsp_name'
else
  this_lsp = '-file_size'
end


--require('staline').setup{
--  sections = {
--    left = {
--      ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
--      'right_sep', '-file_name', 'left_sep', ' ',
--      'right_sep_double', branch, 'left_sep_double', ' ',
--    },
--    mid  = {'-lsp'},
--    right= {
--      'right_sep', '-cool_symbol', 'left_sep', ' ',
--      'right_sep', '- ', this_lsp, '- ', 'left_sep',
--      'right_sep_double', '-line_column', 'left_sep_double', ' ',
--    }
--  },
--
--  defaults={
--    fg = "#f7f7f7",
--    cool_symbol = "  ",
--    left_separator = "",
--    right_separator = "",
--    line_column = "%l:%c [%L]",
--    true_colors = false,
--    line_column = "[%l:%c] 並%p%% ",
--    stab_start  = "",
--    stab_end    = ""
--    --font_active = "bold"
--  },
--  mode_colors = {
--    n  = "#921F81",
--    i  = "#006A6B",
--    ic = "#E4BF7B",
--    c  = "#2a6099",
--    v  = "#D71B39"
--  }
--}
require("staline").setup {
  sections = {
        left = {
            '▊', ' ', { 'Evil', ' ' }, ' ',         -- The mode and evil sign
            'file_size', ' ',                        -- Filesize
            { 'StalineFile', 'file_name' }, ' '       -- Filename in different highlight
          },
          mid = { ' ', 'lsp_name' },                      -- "lsp_name" is still a little buggy
          right = {
                  { 'StalineEnc', vim.bo.fileencoding:upper() }, '  ',  -- Example for custom section
                  { 'StalineEnc', 'cool_symbol' }, ' ',                 -- the cool_symbol for your OS
                  { 'StalineGit', 'branch' }, ' ', '▊'                  -- Branch Name in different highlight
          }
  },
  defaults = {
          bg = "#202328",
          branch_symbol = " "
  },
  mode_colors = {
          n = "#38b1f0",
          i = "#9ece6a",       -- etc mode
  }
}
vim.cmd [[hi Evil        guifg=#f36365 guibg=#202328]]       -- Higlight for Evil symbol
vim.cmd [[hi StalineEnc  guifg=#7d9955 guibg=#202328]]       -- Encoding Highlight
vim.cmd [[hi StalineGit  guifg=#8583b3 guibg=#202328]]       -- Branch Name Highlight
vim.cmd [[hi StalineFile guifg=#c37cda guibg=#202328]]       -- File name Highlight


-- PARA AS LINHAS DE INDENTAÇÃO

vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
  let g:indentLine_fileTypeExclude = ['dashboard']
]])

require'lspconfig'.pyright.setup{}


-- init.lua

-- empty setup using defaults: add your own options
-- require'nvim-tree'.setup {
-- }

-- OR

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS
