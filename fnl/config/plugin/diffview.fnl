(module config.plugin.diffview
  {autoload {diffview diffview}})

;; https://github.com/sindrets/diffview.nvim

(diffview.setup
 {:diff_binaries false
  :enhanced_diff_hl true   ;; See ':h diffview-config-enhanced_diff_hl'

  ;; :git_cmd = { "git" }  ;; The git executable followed by default args.

  :use_icons true          ;; Requires nvim-web-devicons

  ;; Only applies when use_icons is true.
  :icons
  {:folder_closed ""
   :folder_open ""}})
