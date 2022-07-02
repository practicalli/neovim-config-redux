(module config.plugin.todocomments
  {autoload {todos todo-comments}})

;; https://github.com/folke/todo-comments.nvim

(todos.setup
 {;; Show todo icons in the gutter
  :signs true
  :sign_priority 5})

