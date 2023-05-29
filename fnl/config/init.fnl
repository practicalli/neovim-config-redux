(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})


;; --------------------
;; Key bindings (mappings)

;; generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Insert mode: fd as Escape short cut
(nvim.set_keymap :i :fd "<ESC>" {:noremap true})

;; killring / registers
;; clipboard history
(util.lnnoremap :ch "Telescope neoclip")

;; terminal
(util.lnnoremap :. "ToggleTerm")

;; Tabs
(util.lnnoremap :tt "Telescope tele_tabby list") ;; Visual tab switch
(util.lnnoremap :td "tabclose")
(util.lnnoremap :tn "tabnext")
(util.lnnoremap :tp "tabprevious")
(util.lnnoremap :to "tabonly") ;; Only show active tab
(util.lnnoremap :tm "tab sp") ;; Creates a new split as a tab ??

;;;; Windows
;; Move cursor between windows
(util.lnnoremap :wh "wincmd h")
(util.lnnoremap :wj "wincmd j")
(util.lnnoremap :wk "wincmd k")
(util.lnnoremap :wl "wincmd l")
;; Maximise window (or is this tab?)
(util.lnnoremap :wm "only")
(util.lnnoremap :ws "split") ;; Horizontal window split
(util.lnnoremap :wv "vsplit") ;; Vertical window split

;; Buffers
;; Toggle between current and last active buffer
(util.lnnoremap :<tab> "b#")
(util.lnnoremap :ba "ball")
(util.lnnoremap :bb "Telescope buffers")
(util.lnnoremap :bd "bdelete")
(util.lnnoremap :bn "bnext")
(util.lnnoremap :bp "bprevious")

;; Projects and files
;; - moved to which-key

;; Help and documentation
(util.lnnoremap :hh "Telescope help_tags")
(util.lnnoremap :jh "Telescope heading")

(util.lnnoremap :dtb "Telescope terraform_doc")

;; Colors and themes
(util.lnnoremap :cs "Telescope colorscheme")
(util.lnnoremap :cd "NewpaperDark")
(util.lnnoremap :cl "NewpaperLight")

;; Package Manager
;; list packages
(util.lnnoremap :Pl "Telescope packer")
(util.lnnoremap :Pi "PackerInstall")
(util.lnnoremap :Ps "PackerSync")
(util.lnnoremap :Pu "PackerUpdate")

;; Treesitter parsers update
(util.lnnoremap :Ptu "TSUpdate")
;; Treesitter parsers install status
(util.lnnoremap :Pti "TSInstallInfo")

;; Quit
(util.lnnoremap :qa "quitall")
(util.lnnoremap :qq "quit")
(util.lnnoremap :qQ "quit!")

;; Git Version control
(util.lnnoremap :gd "DiffviewOpen")
(util.lnnoremap :gs "Neogit")

;; GitHub - requires `gh auth login`

(util.lnnoremap :gga "Octo actions")
(util.lnnoremap :gggl "Octo gist list")

(util.lnnoremap :ggib "Octo issue browser")
(util.lnnoremap :ggic "Octo issue create")
(util.lnnoremap :ggil "Octo issue list")
(util.lnnoremap :ggis "Octo issue search")
(util.lnnoremap :ggiu "Octo issue url")

(util.lnnoremap :ggpb "Octo pr browser")
(util.lnnoremap :ggpc "Octo pr create")
(util.lnnoremap :ggpl "Octo pr list")
(util.lnnoremap :ggps "Octo pr search")
(util.lnnoremap :ggpu "Octo pr url")

(util.lnnoremap :ggrb "Octo repo browse")
(util.lnnoremap :ggrf "Octo repo fork")
(util.lnnoremap :ggrl "Octo repo list")
(util.lnnoremap :ggru "Octo repo url")




;; Clojure Reader macro
(util.lnnoremap :cc "(i#_<ESC>")
(util.lnnoremap :cu "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>")

;; escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})


;; --------------------
;; Filetype configuration

;; Set Conjure and other filetype line comments to ;;
(vim.api.nvim_create_autocmd
  :FileType
  {:group    (vim.api.nvim_create_augroup :commentary_config {:clear true})
   :pattern  [:lisp :clojure :racket :fennel]
   :callback (fn [] (set vim.opt_local.commentstring ";; %s") nil)})

;; set filetypes filename extensions for Clojure
;; autocmd BufNewFile,BufRead .edn,clj,.cljstyle set filetype=clojure
(nvim.ex.autocmd "BufNewFile,BufRead" ".edn,.clj,.cljstyle" "set filetype=clojure")

;; clear symbol highlighting on enter in normal mode
(util.nnoremap :<CR> "noh<CR><CR>")


;; --------------------
;; Neovim global variables

;; Markdown mode conceal links
;; DRAGONS: conceal not working by default and this config doesnt work either :sadface
(util.set-global-variable vim_markdown_conceal 2)


;; --------------------
;; Neovim - global editor options

;; refresh changed content
(nvim.ex.autocmd "FocusGained,BufEnter" "*" ":checktime")

;; Line settings - don't wrap lines
(nvim.ex.set :nowrap)

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
       ;; single column for signs(icons) and line numbers
       :signcolumn "number"
       ;; Width of gutter (number + sign columns)
       ;; :numberwidth 3  ;; relative numbers should only need 2 columns

       ;; syntax highlight code blocks in markdown
       ;; :markdown_fenced_languages ["clojure" "html" "json" "css" "scss" "lua" "vim" "yaml"]

       }]
  (each [option value (pairs options)]
    (util.set-global-option option value)))

;; ------------ Global variables

;; Disable Language Providers to remove warning in :checkhealth
;; (util.set-global-variable loaded_perl_provider 0)

;import plugin.fnl
(require :config.plugin)
