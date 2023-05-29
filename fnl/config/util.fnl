(module config.util
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(defn insert-keymap [from to]
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (nvim.set_keymap :i from to map-opts)))

(defn nnoremap [from to opts]
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (if (core.get opts :local?)
      (nvim.buf_set_keymap 0 :n from to map-opts)
      (nvim.set_keymap :n from to map-opts))))

(defn lnnoremap [from to]
  (nnoremap (.. "<leader>" from) to))

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn set-global-option [key value]
  "Sets a nvim global options"
  (core.assoc nvim.o key value))

(defn set-global-variable [key value]
  "Sets a nvim global variables"
  (core.assoc nvim.g key value))


;; To evaluate
;; https://github.com/D00mch/dotfiles/blob/master/.config/nvim/fnl/util.fnl

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn +docs [opts to]
  (core.update opts :desc (fn [desc] (or desc to))))

(defn +buffer [opts buffer]
  (core.update opts :buffer (fn [b] (or b buffer))))

(defn kset [modes from to opts]
  (let [opts  (if
                (= (type opts) "table")  opts
                (= (type opts) "string") {:desc opts})]
    (vim.keymap.set modes from to (+docs opts to))))

;; opts could be options map or just a buffer
(defn bkset [modes from to opts]
  (let [opts  (if
                (= (type opts) "table")  (+buffer opts 0)
                (= (type opts) "number") {:buffer opts}
                (= (type opts) "string") {:desc opts}
                {:buffer 0})]
    (vim.keymap.set modes from to (+docs opts to))))

;; maps operation to visual, rows only
(defn vis-op [op args]
  #(op
     [(vim.fn.line ".") (vim.fn.line "v")]
     args))

;; maps operation to visual
(defn vis-op+ [op args]
  #(op
     [(vim.api.nvim_buf_get_mark 0 "<")
      (vim.api.nvim_buf_get_mark 0 ">")]
     args))
