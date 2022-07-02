(module config.plugin.lspcolors
  {autoload {lspcolors lsp-colors}})

;; https://github.com/folke/lsp-colors.nvim

(lspcolors.setup
 {
  ;; :Error "#db4b4b",
  ;; :Warning "#e0af68",
  ;; :Information "#0db9d7",
  ;; :Hint "#10B981"
})