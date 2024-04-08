-- INFO: formatter
return {
	"stevearc/conform.nvim",
	lazy = false,
	event = { "BufReadPre", "BufNewFile", "BufWrite" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			desc = "format file",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "black" },
			lua = { "stylua" },
			markdown = { "prettier" },
			sh = { "beautysh" },
			json = { "prettier" },
			yaml = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			java = { "google-java-format" },
			graphql = { "prettier" },
			sql = { "sqlfluff" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
