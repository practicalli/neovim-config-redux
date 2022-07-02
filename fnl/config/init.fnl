(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; generic mapping leaders configuration

(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;;;; Line settings
;don't wrap lines
(nvim.ex.set :nowrap)
;; Line numbers - relative
(nvim.ex.set :relativenumber)

;; Spacemacs style leader mappings.

;; Managing Tabs
(nvim.set_keymap :n :<leader>tn ":tabnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>tp ":tabprevious<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>to ":tabonly<cr>" {:noremap true})

;; Creates a new split as a tab ??  Not sure about this one
(nvim.set_keymap :n :<leader>tm ":tab sp<cr>" {:noremap true})

;;;; Managing windows
;; Maximise window
(nvim.set_keymap :n :<leader>wm ":only<cr>" {:noremap true})

;; managing buffers
(nvim.set_keymap :n :<leader>bn ":bnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>bp ":bprevious<cr>" {:noremap true})

;; managing files
(nvim.set_keymap :n :<leader>fs ":write<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>fc ":saveas<cr>" {:noremap true})

;; Quit
(nvim.set_keymap :n :<leader>qq ":quit<cr>" {:noremap true})

;; Insert mode: fd as Escape short cut
(nvim.set_keymap :i :fd "<ESC>" {:noremap true})

;; Git Version control
(nvim.set_keymap :n :<leader>gd ":DiffviewOpen<cr>" {:noremap true})


;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

;import plugin.fnl
(require :config.plugin)
