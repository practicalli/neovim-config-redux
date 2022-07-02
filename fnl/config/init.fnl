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


;; Set Conjure comments to ;;
;; this is only for conjure eval to comments though
;; g:conjure#eval#comment_prefix=";; "

;; (nvim.ex.autocmd "FileType" "clojure "setlocal" "commentstring" ";;\ ")
;; (nvim.ex.autocmd "FocusGained,BufEnter" "*" ":checktime")

(vim.api.nvim_create_autocmd
  :FileType
  {:group    (vim.api.nvim_create_augroup :commentary_config {:clear true})
   :pattern  [:lisp :clojure :racket]
   :callback (fn [] (set vim.opt_local.commentstring ";; %s") nil)})



;clear highlighting on enter in normal mode
;; (nvim.set_keymap :n :<CR> ":noh<CR><CR>" {:noremap true})

;escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})

;; Spacemacs style leader mappings.
;; Tabs
(nvim.set_keymap :n :<leader>tn ":tabnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>tp ":tabprevious<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>to ":tabonly<cr>" {:noremap true})

;; Creates a new split as a tab ??  Not sure about this one
(nvim.set_keymap :n :<leader>tm ":tab sp<cr>" {:noremap true})

;;;; Windows
;; Maximise window (or is this tab?)
(nvim.set_keymap :n :<leader>wm ":only<cr>" {:noremap true})

;; Buffers

(util.lnnoremap :ba ":ball")
;; (nvim.set_keymap :n :<leader>ba ":ball<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>bd ":bdelete<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>bn ":bnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>bp ":bprevious<cr>" {:noremap true})
;; Toggle between previous and current buffer
(nvim.set_keymap :n :<leader><tab>":bprevious<cr>" {:noremap true})

;; Projects and files
(nvim.set_keymap :n :<leader>fs ":write<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>fc ":saveas<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>ft":NvimTreeToggle<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>pt":NvimTreeFindFile<cr>" {:noremap true})

;; Quit
(nvim.set_keymap :n :<leader>qa ":quitall<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>qq ":quit<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>qQ ":quit!<cr>" {:noremap true})

;; Insert mode: fd as Escape short cut
(nvim.set_keymap :i :fd "<ESC>" {:noremap true})

;; Git Version control
(nvim.set_keymap :n :<leader>gd ":DiffviewOpen<cr>" {:noremap true})

;; Clojure Reader macro
(nvim.set_keymap :n :<leader>cc "(i#_<ESC>" {:noremap true})
(nvim.set_keymap :n :<leader>cu "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>" {:noremap true})

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
