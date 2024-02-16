# My NeoVim configuration style guide

This tutorial is purely for me to keep my plugin configuration style in mind.

[General rules](#general-rules)

[Plugin configuration rules](#plugin-configuration-rules)

[Language configuration rules](#language-configuration-rules)

## General rules

- The entire configuration should be written in lua, never use vimscript;
- All configuration files should be linted with luacheck;

## Plugin configuration rules

### One file - one plugin

Each file should contain the configuration of only one plugin. This rule increases the modularity and convenience of
the configuration.

### Note comment at start

Always leave a NOTE comment at the beginning of the configuration file to remember why you need the plugin in the first
place. It is desirable to leave a comment about each dependency as well.

### All dependencies

If a plugin has dependencies, all of them must be specified in the configuration.
Even if they are already installed or are dependencies of other plugins.
Otherwise, if one day you have to abandon a plugin, its dependencies may be lost and cause errors in other plugins.

### opts over config

Favor opts over config. Use config() only in very complex cases.

### Don't use default settings

Do not copy the default settings into configuration. It just doesn't make sense.

### Configuration section order

Stick to a specific order of configuration sections.

1. Plugin address.
2. lazy
3. dependencies
4. keys
5. opts
6. opts/config()
7. build

### Always add which-key configuration

Never forget to add hotkey information to the which-key plugin when you create a new one.

## Language configuration rules

If you need to add support for a new language, there are a few rules of thumb.

### Add language support via LSP

For language support, I use LSP. To add an LSP, follow the steps below.

1. Add the language server from Mason to the ./lua/plugin/lsp/mason.lua file, mason_lspconfig.setup section.
2. Add the language server from Mason to the ./lua/plugin/lsp/lspconfig.lua.
3. Add the language to the ./lua/plugin/editor/treesitter.lua.

### Add the linter

Always add linters if you can.

1. Add the linter to the ./lua/plugin/lsp/mason.lua file, mason_tool_installer.setup section.
2. Add the linter to the ./lua/plugin/lsp/lint.lua file.

### Add the formatter

Always add formatters if you can.

1. Add the linter to the ./lua/plugin/lsp/mason.lua file, mason_tool_installer.setup section.
2. Add the linter to the ./lua/plugin/lsp/conform.lua file.

### Comment lsp/linter/formatter

Add comments if the name of the lsp/linter/formatter doesn't speak for itself.
F.e. black for python.
