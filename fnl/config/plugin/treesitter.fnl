(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed ["clojure" "fennel" "markdown" "org"]
   :sync_install true
   :highlight {:enable true}
   :indent    {:enable true}})
