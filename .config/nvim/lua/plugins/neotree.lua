require('neo-tree').setup({
  close_if_last_window = false,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  enable_normal_mode_for_inputs = false,
  open_files_do_not_replace_types = {
    'terminal',
    'trouble',
    'qf'
  },
  sort_case_insensitive = true,
  sort_function = nil,
  source_selector = {
    winbar = true,
    statusline = false
  },
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = nil,
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander'
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '󰜌',
      default = '*',
      highlight = 'NeoTreeFileIcon'
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = false,
      highlight = 'NeoTreeFileName'
    },
    git_status = {
      symbols = {
        -- Change type
        added     = '',
        modified  = '',
        deleted   = '',
        renamed   = '',

        -- Status type
        untracked = '',
        ignored   = '',
        unstaged  = '',
        staged    = '',
        conflict  = ''
      }
    },
    file_size = {
      enabled = true,
      required_width = 64
    },
    type = {
      enabled = false
    },
    last_modified = {
      enabled = true,
      required_width = 88
    },
    created = {
      enabled = true,
      required_width = 110
    },
    symlink_target = {
      enabled = false
    }
  },
  window = {
    position = 'left',
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true
    },
    mappings = {
      ['<space>'] = { 
        'toggle_node', 
        nowait = false
      },
      ['<2-LeftMouse>'] = 'open',
      ['<cr>'] = 'open',
      ['<esc>'] = 'cancel',
      ['P'] = {
        'toggle_preview',
        config = {
          use_float = true,
          use_image_nvim = true
        }
      },
      ['l'] = 'focus_preview',
      ['S'] = 'open_split',
      ['s'] = 'open_vsplit',
      ['t'] = 'open_tabnew',
      ['C'] = 'close_node',
      ['z'] = 'close_all_nodes',
      ['a'] = { 
        'add',
        config = {
          show_path = 'none'
        }
      },
      ['A'] = 'add_directory',
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy',
      ['m'] = 'move',
      ['q'] = 'close_window',
      ['R'] = 'refresh',
      ['?'] = 'show_help',
      ['<'] = 'prev_source',
      ['>'] = 'next_source',
      ['i'] = 'show_file_details'
    }
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true,
      always_show = { 
        '.gitignore',
        '.gitmodules' 
      },
      never_show = {},
      never_show_by_pattern = {}
    },
    follow_current_file = {
      enabled = false,
      leave_dirs_open = false
    },
    group_empty_dirs = false,
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = false,
    window = {
      mappings = {
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
        ['H'] = 'toggle_hidden',
        ['/'] = 'fuzzy_finder',
        ['D'] = 'fuzzy_finder_directory',
        ['#'] = 'fuzzy_sorter',
        ['f'] = 'filter_on_submit',
        ['<c-x>'] = 'clear_filter',
        ['[g'] = 'prev_git_modified',
        [']g'] = 'next_git_modified',
        ['o'] = {
          'show_help',
          nowait=false,
          config = {
            title = 'Order by',
            prefix_key = 'o' 
          }
        },
        ['oc'] = {
          'order_by_created',
          nowait = false
        },
        ['od'] = {
          'order_by_diagnostics',
          nowait = false
        },
        ['og'] = {
          'order_by_git_status',
          nowait = false
        },
        ['om'] = {
          'order_by_modified',
          nowait = false
        },
        ['on'] = {
          'order_by_name',
          nowait = false
        },
        ['os'] = {
          'order_by_size',
          nowait = false
        },
        ['ot'] = {
          'order_by_type',
          nowait = false
        }
      },
      fuzzy_finder_mappings = {
        ['<down>'] = 'move_cursor_down',
        ['<C-n>'] = 'move_cursor_down',
        ['<up>'] = 'move_cursor_up',
        ['<C-p>'] = 'move_cursor_up'
      }
    },
    commands = {}
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false
    },
    group_empty_dirs = true,
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
        ['o'] = {
          'show_help',
          nowait=false,
          config = {
            title = 'Order by',
            prefix_key = 'o'
          }
        },
        ['oc'] = {
          'order_by_created',
          nowait = false
        },
        ['od'] = {
          'order_by_diagnostics',
          nowait = false 
        },
        ['om'] = {
          'order_by_modified',
          nowait = false
        },
        ['on'] = {
          'order_by_name',
          nowait = false
        },
        ['os'] = {
          'order_by_size',
          nowait = false
        },
        ['ot'] = {
          'order_by_type',
          nowait = false
        }
      }
    }
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['A']  = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
        ['o'] = {
          'show_help',
          nowait=false,
          config = {
            title = 'Order by',
            prefix_key = 'o'
          }
        },
        ['oc'] = {
          'order_by_created',
          nowait = false
        },
        ['od'] = {
          'order_by_diagnostics',
          nowait = false 
        },
        ['om'] = {
          'order_by_modified',
          nowait = false
        },
        ['on'] = {
          'order_by_name',
          nowait = false
        },
        ['os'] = {
          'order_by_size',
          nowait = false
        },
        ['ot'] = {
          'order_by_type',
          nowait = false
        }
      }
    }
  }
})
