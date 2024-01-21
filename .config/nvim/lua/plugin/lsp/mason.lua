return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
				height = 0.8,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"pyright",
				"lua_ls",
				"marksman",
				"dockerls",
				"docker_compose_language_service",
				"bashls",
				"jsonls",
				"yamlls",
				"taplo",
				"html",
				"cssls",
				"eslint",
				"tsserver",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Linters
				"luacheck",
				"pylint",
				"hadolint",
				"eslint_d",
				"stylelint",

				-- Formatters
				"black", -- Python formatter
				"stylua",
				"beautysh",
				"prettier",
			},
		})
	end,
}
