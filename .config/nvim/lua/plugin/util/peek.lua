-- INFO: preview markdown files
return {
	"toppair/peek.nvim",
	lazy = true,
	event = { "VeryLazy" },
	config = function()
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
	build = "deno task --quiet build:fast",
}
