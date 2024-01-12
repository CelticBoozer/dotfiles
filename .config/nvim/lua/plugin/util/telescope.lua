return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim"
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key"
        }
      }
    },
    extensions = {
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
        find_cmd = "rg"
      }
    }
  }
}
