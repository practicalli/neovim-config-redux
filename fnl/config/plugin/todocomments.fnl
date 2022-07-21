(module config.plugin.todocomments
  {autoload {todos todo-comments}})

;; https://github.com/folke/todo-comments.nvim
;; PERF: performance review
;; HACK: to be improved
;; TODO: task to be done
;; DONE: completed task
;; NOTE: a reminder or info to remember
;; FIX:  a known thing that is broken
;; WARN: warning
;; DRAGONS: here be dragons

(todos.setup
 {;; Show todo icons in the gutter
  :signs true
  ;; Priority of display in gutter, 1-9, highest number wins
  :sign_priority 5

  ;; match keywords in comments only
  :comments_only true

  ;; Customisation of todo, adding alternate match and icon
  :keywords
  {:TODO {:icon ""}
   :DONE {:icon ""}
   :WARN {:icon ""
          :alt ["WARNING" "XXX" "DRAGONS"]}}})
