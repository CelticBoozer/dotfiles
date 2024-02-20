-- INFO: LSP configuration
return {
	"neovim/nvim-lspconfig",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lspconfig.ui.windows").default_options.border = "rounded"
		vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#e2cca9" })
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
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
		lspconfig.marksman.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.dockerls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.docker_compose_language_service.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.taplo.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.groovyls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig.sqlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
