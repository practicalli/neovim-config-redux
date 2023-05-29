(module config.plugin.lua-snip
  {autoload {vscode luasnip.loaders.from_vscode}})

;; Load local snippets - relative to user config root
(vscode.lazy_load {:paths ["./snippets"]})

