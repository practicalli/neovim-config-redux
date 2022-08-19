(module config.plugin.gitsigns
  {autoload {gitsigns gitsigns}})

;; https://github.com/lewis6991/gitsigns.nvim

(gitsigns.setup
 {:signs
  {:add          {:hl :GitSignsAdd    :text  "│" :numhl :GitSignsAddNr    :linehl :GitSignsAddLn}
   :change       {:hl :GitSignsChange :ftext "│" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}
   :delete       {:hl :GitSignsDelete :ftext "_" :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}
   :topdelete    {:hl :GitSignsDelete :ftext "‾" :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}
   :changedelete {:hl :GitSignsChange :text  "~" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}}

  :sign_priority 6

;; Highlighting changes

  ;; Add signs in Neovim gutter (over-rides other signs and numbers if signcolumn set to number)
  ;; Toggle with `:Gitsigns toggle_signs` (default:true)
  :signcolumn false

  ;; Hightlight line number in gutter for lines that contain a change
  ;; Toggle with `:Gitsigns toggle_numhl` (default: false)
  :numhl true

  ;; Highlight lines in buffer that contain a change
  ;; Toggle with `:Gitsigns toggle_linehl` (default: false)
  :linehl false

  ;; Highlight words that have changed in a line that have changed
  ;; Toggle with `:Gitsigns toggle_word_diff` (default: false)
  :word_diff false

  :watch_gitdir {:interval 1000 :follow_files true}

  :attach_to_untracked true

  ;; Toggle with `:Gitsigns toggle_current_line_blame`
  :current_line_blame false

  :current_line_blame_opts
  {:virt_text true
   :virt_text_pos :eol ;; :eol | :overlay | :right_align
   :delay 1000
   :ignore_whitespace false}

  ;; TODO: blame formatter key expects function
  ;; :current_line_blame_formatter "<author>, <author_time:%Y-%m-%d> - <summary>"
  :sign_priority 6
  :update_debounce 100
  :status_formatter nil  ;; Use default
  :max_file_length 40000 ;; Disable if file is longer than this (in lines)
  :preview_config
  {;; Options passed to nvim_open_win
   :border :single
   :style :minimal
   :relative :cursor
   :row 0
   :col 1}

  :yadm {:enable false}})
