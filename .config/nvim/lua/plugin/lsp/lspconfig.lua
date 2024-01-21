return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.pyright.setup({})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
				},
			},
		})
		lspconfig.marksman.setup({})
		lspconfig.dockerls.setup({})
		lspconfig.docker_compose_language_service.setup({})
		lspconfig.bashls.setup({})
		lspconfig.jsonls.setup({})
		lspconfig.yamlls.setup({})
		lspconfig.taplo.setup({})
		lspconfig.html.setup({})
		lspconfig.cssls.setup({})
		lspconfig.eslint.setup({})
		lspconfig.tsserver.setup({})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
