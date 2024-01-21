return {
	"williamboman/mason-lspconfig.nvim",
	priority = 300,
	opts = {
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
	},
}
