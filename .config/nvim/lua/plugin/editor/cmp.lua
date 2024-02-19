-- INFO: completion engine
return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = { "InsertEnter" },
	dependencies = {
		"neovim/nvim-lspconfig", -- LSP server support
		"hrsh7th/cmp-nvim-lsp", -- LSP support for completion
		"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
		"hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths
		"hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline
		"L3MON4D3/LuaSnip", -- Snippet support
		"saadparwaiz1/cmp_luasnip", -- Snippet support
		"onsails/lspkind.nvim", -- Plugin adds vscode-like pictograms to neovim built-in lsp
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lsp_signature_help" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
