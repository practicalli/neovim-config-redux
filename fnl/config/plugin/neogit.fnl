(module config.plugin.neogit
  {autoload {neogit neogit}})

;; https://github.com/folke/lsp-colors.nvim

(neogit.setup
 {
  ;; https://github.com/TimUntersberger/neogit#configuration

  :integrations {:diffview true}
 })