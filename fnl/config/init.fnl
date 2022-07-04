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



;clear symbol highlighting on enter in normal mode
(util.nnoremap :<CR> ":noh<CR><CR>")

;escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})

;; Spacemacs style leader mappings.
;; Tabs
(util.lnnoremap :tt ":Telescope tele_tabby list") ;; Visual tab switch
(util.lnnoremap :td ":tabclose<cr>")
(util.lnnoremap :tn ":tabnext<cr>")
(util.lnnoremap :tp ":tabprevious<cr>")
(util.lnnoremap :to ":tabonly<cr>") ;; Only show active tab
(util.lnnoremap :tm ":tab sp<cr>") ;; Creates a new split as a tab ??


(util.lnnoremap :sv ":vsplit<cr>") ;; Creates a new split as a tab ??

;;;; Windows
;; Move cursor between windows
(util.lnnoremap :wh ":wincmd h<cr>")
(util.lnnoremap :wj ":wincmd j<cr>")
(util.lnnoremap :wk ":wincmd k<cr>")
(util.lnnoremap :wl ":wincmd l<cr>")
;; Maximise window (or is this tab?)
(util.lnnoremap :wm ":only<cr>")

;; Buffers
;; Toggle between current and last active buffer
(util.lnnoremap :<tab>":b#<cr>")
(util.lnnoremap :ba ":ball<cr>")
(util.lnnoremap :bd ":bdelete<cr>")
(util.lnnoremap :bn ":bnext<cr>")
(util.lnnoremap :bp ":bprevious<cr>")

;; Projects and files
;; Find files in a project
(util.lnnoremap :ff":Telescope file_browser")
(util.lnnoremap :fs ":write<cr>")
(util.lnnoremap :fc ":saveas<cr>")
(util.lnnoremap :ft":NvimTreeToggle<cr>")
(util.lnnoremap :pt":NvimTreeFindFile<cr>")

;; Package Manager
(util.lnnoremap :pi":PackerInstall<cr>")
(util.lnnoremap :ps":PackerSync<cr>")
(util.lnnoremap :pu":PackerUpdate<cr>")

;; Treesitter parsers update
(util.lnnoremap :pti":TSInstallInfo<cr>")
;; Treesitter parsers install status
(util.lnnoremap :pti":TSInstallInfo<cr>")

;; Quit
(util.lnnoremap :qa ":quitall<cr>")
(util.lnnoremap :qq ":quit<cr>")
(util.lnnoremap :qQ ":quit!<cr>")

;; Insert mode: fd as Escape short cut
(util.insert-keymap :fd "<ESC>")

;; Git Version control
(util.lnnoremap :gd ":DiffviewOpen<cr>")
(util.lnnoremap :gs ":Neogit")

;; Clojure Reader macro
(util.lnnoremap :cc "(i#_<ESC>")
(util.lnnoremap :cu "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>")

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
       :list false
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
