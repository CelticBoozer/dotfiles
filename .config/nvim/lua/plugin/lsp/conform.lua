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
					async = true,
					timeout_ms = 1000,
				})
			end,
			desc = "Format file",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "ruff" },
			lua = { "stylua" },
			markdown = { "prettier" },
			sh = { "shfmt" },
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
			xml = { "xmlformatter" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	async = true,
		-- 	timeout_ms = 1000,
		-- },
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		}),
	},
}
