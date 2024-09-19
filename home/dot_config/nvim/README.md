# Neovim config

* Use `lazy.nvim` for plugins management

## Layouts

* **nvim/after/ftplugin**  plugin files here are sourced after $VIMRUNTIME/ftplugin/*.(vim|lua)
* **nvim/after/plugin**    loaded after the plugin directory, used to overrides plugin's and vim/nvim internals 
* **nvim/autoload**        automatically loaded scripts
* **nvim/ftdetect**        extra filetype detection, for template settings...
* **nvim/ftplugin**        plugin files are sourced before $VIMRUNTIME/ftplugin/*.(vim|lua)
* **nvim/lua**             lua config files
* **nvim/plugin**          files that are always loaded only once by vim/nvim
* **nvim/snippets**        snippets directory in the vscode/snipmate format
* **nvim/spell**           spelling files

## Todo

* move lsp config per language/filetype into either nvim/ftplugin files or nvim/after/ftplugin
