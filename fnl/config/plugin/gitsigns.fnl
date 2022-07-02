(module config.plugin.gitsigns
  {autoload {gitsigns gitsigns}})

;; https://github.com/lewis6991/gitsigns.nvim

(gitsigns.setup
 {:sign_priority 6})

