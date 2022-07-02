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
      {
       :encoding "utf-8"
       :spelllang "en_gb"
       ;; :backspace "2"
       ;; Visual column indicator
       ;; :colorcolumn "80"
       :errorbells false
       ;; :backup false
       ;; :swapfile false
       ;; :showmode false
       ;; show line numbers
       ;; :number true
       :relativenumber true
       ;show line and column number
       :ruler true
       ;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;turn on the wild menu, auto complete for commands in command line
       :wildmenu true
       :wildignore "*/tmp/*,*.so,*.swp,*.zip"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard
       :clipboard "unnamedplus"
       ;show invisible characters
       :list true
       :listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«" "eol:¬"])
       ;tabs is space
       :expandtab true
       ;tab/indent size
       ;; :tabstop 2
       ;; :shiftwidth 2
       ;; :softtabstop 2
       ;persistent undo
       ;; :undofile true
       ;open new horizontal panes on down pane
       :splitbelow true
       ;open new vertical panes on right pane
       :splitright true
       ;enable highlighting search
       :hlsearch true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (util.set-global-option option value)))


;import plugin.fnl
(require :config.plugin)
