require('Comment').setup({
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = 'gcc',
    block = 'gbc'
  },
  opleader = {
    line = 'gc',
    block = 'gb'
  },
  mappings = {
    basic = true,
    extra = true
  },
  pre_hook = nil,
  post_hook = nil,
})
