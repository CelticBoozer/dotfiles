# My NeoVim configuration style guide

This tutorial is purely for me to keep my plugin configuration style in mind.

[General rules](#general-rules)
[Plugin configuration rules](#plugin-rules)
[Language configuration rules](#language-rules)

## General rules {#general-rules}

- The entire configuration should be written in lua, never use vimscript;
- All configuration files should be linted with luacheck;

## Plugin configuration rules {#plugin-rules}

### One file - one plugin

Each file should contain the configuration of only one plugin.

### All dependencies

If a plugin has dependencies, all of them must be specified in the configuration.
Even if they are already installed or are dependencies of other plugins.
Otherwise, if one day you have to abandon a plugin, its dependencies may be lost and cause errors in other plugins.

## Language configuration rules {#language-rules}
