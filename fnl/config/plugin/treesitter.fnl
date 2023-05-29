(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["clojure" "fennel" "markdown" "org" "html"]
   :sync_install true
   :highlight {:enable true}
   :indent    {:enable true}})
