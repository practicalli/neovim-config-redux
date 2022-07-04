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
