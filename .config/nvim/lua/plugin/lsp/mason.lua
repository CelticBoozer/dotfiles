-- INFO: LSP install tool configuration
return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- For LSP configuration
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- For linters and  formatters automatic installation
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
				"ruff_lsp", -- Python LSP
				"lua_ls",
				"marksman",
				"dockerls",
				"docker_compose_language_service",
				"bashls",
				"jsonls",
				"yamlls",
				"taplo", -- TOML LSP
				"html",
				"cssls",
				"eslint",
				"tsserver",
				"jdtls",
				"groovyls",
				"sqlls",
				"lemminx", -- XML LSP
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Linters
				"ruff", -- Python linter
				"luacheck",
				"hadolint", -- Docker linter
				"shellcheck",
				"jsonlint",
				"yamllint",
				"eslint_d",
				"stylelint",
				"checkstyle",
				"sqlfluff",

				-- Formatters
				"ruff", -- Python formatter
				"stylua",
				"shfmt",
				"prettier",
				"google-java-format",
				"sql-formatter",
				"xmlformatter",
			},
		})
	end,
}
