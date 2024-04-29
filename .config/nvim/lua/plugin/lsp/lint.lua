-- INFO: linter
return {
	"mfussenegger/nvim-lint",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>ll",
			function()
				require("lint").try_lint()
			end,
			desc = "lint file",
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
			lua = { "luacheck" },
			dockerfile = { "hadolint" },
			sh = { "shellcheck" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			java = { "checkstyle" },
			sql = { "sqlfluff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
