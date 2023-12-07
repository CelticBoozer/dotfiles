require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = {
      left = '',
      right = ''
    },
    section_separators = {
      left = '',
      right = ''
    },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,  
        symbols = { added = '+', modified = '~', removed = '-' },
        source = nil,
      },
      {
        'diagnostics',
        sources = {
          'nvim_diagnostic',
          'nvim_lsp' 
        },
        sections = {
          'error',
          'warn',
          'info',
          'hint'
        },
        symbols = {
          error = 'E',
          warn = 'W',
          info = 'I',
          hint = 'H' 
        },
        colored = true,
        update_in_insert = true,
        always_visible = false,
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[RO]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    },
    lualine_x = {
      {
        'searchcount',
        maxcount = 999,
        timeout = 10,
      },
      'encoding', 
      {
        'filetype',
        colored = true,
        icon_only = false,
        icon = { align = 'left' },
      }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}
