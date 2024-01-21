return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			-- Linters
			"luacheck",
			"pylint",
			"hadolint",
			"eslint_d",
			"htmlhint",
			"stylelint",

			-- Formatters
			"black", -- Python formatter
			"stylua",
			"beautysh",
			"prettier",
		},
	},
}
