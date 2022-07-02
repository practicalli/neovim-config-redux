(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})


;; TODO: review conjure options

;; (set nvim.g.conjure#mapping#doc_word "K")
;; (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
;; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

;; (set nvim.g.conjure#eval#result_register :e)
   (set nvim.g.conjure#log#botright true)
;; (set nvim.g.conjure#filetypes [:clojure :fennel])


;; No longer required - set by default probably
;; (set nvim.g.conjure#eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}) ; eval comment as do
