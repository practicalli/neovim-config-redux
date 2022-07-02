(module config.plugin.nvim-tree
  {autoload {tree nvim-tree}})

;; https://github.com/kyazdani42/nvim-tree.lua

(tree.setup
 {:sort_by "case_sensitive"
  :view {:adaptive_size true
         :mappings {:list [{:key "u" :action "dir_up"}]}}
  :renderer {:group_empty true}
  :filters {:dotfiles false}
  })


  ;; sort_by = "case_sensitive",
  ;; view = {
  ;;   adaptive_size = true,
  ;;   mappings = {
  ;;     list = {
  ;;       { key = "u", action = "dir_up" },
  ;;     },
  ;;   },
  ;; },
  ;; renderer = {
  ;;   group_empty = true,
  ;; },
  ;; filters = {
  ;;   dotfiles = true,
  ;; },
