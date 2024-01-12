return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = ':'
    },
    popup = {
      position = {
        row = '20%',
        col = '50%'
      },
      size = {
        width = '40%'
      },
      border = {
        style = 'rounded'
      }
    }
  },
}