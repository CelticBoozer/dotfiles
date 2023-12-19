local bufferline = require('bufferline')

bufferline.setup{
  options = {
    mode = "tabs",
    style_preset = bufferline.style_preset.default,
    themable = true,
    numbers = "ordinal",
    right_mouse_command = false,
    indicator = {
      style = 'underline',
    },
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(name)
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    offsets = {
      { 
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      }
    },
    color_icons = true,
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    move_wraps_at_ends = false,
    separator_style = "slope",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    hover = {
      enabled = true,
      delay = 100,
      reveal = {'close'}
    },
  },
  highlights = {
    fill = {
      fg = '#252423',
      bg = '#252423',
    },
    background = {
      fg = '#a89984',
      bg = '#504945',
    },
    separator = {
      fg = '#252423',
      bg = '#504945',
    },
    separator_selected = {
      fg = '#252423',
      bg = '#32302f',
    },
    close_button = {
      fg = '#e2cca9',
      bg = '#504945',
    },
    close_button_selected = {
      fg = '#e2cca9',
      bg = '#32302f',
    },
    numbers = {
      fg = '#a89984',
      bg = '#504945',
    },
    numbers_selected = {
      fg = '#e2cca9',
      bg = '#32302f',
      bold = true,
      italic = true,
    },
  },
}
