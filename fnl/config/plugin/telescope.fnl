(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             actions telescope.actions
             themes telescope.themes}})

(telescope.setup
  {:defaults {:file_ignore_patterns ["node_modules"]
              ;; Use Esc key (once) to leave telescope popup - otherwise it first goes to normal mode
              ;; :mappings {:i {["<esc>"] actions.close}}
              }
   :extensions {:env {}
                :ui-select {1 (themes.get_dropdown {})}
                :tele_tabby {:use_highlighter false}
                :packer {}
                :project {}}
   :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git"]}}})

;; Load Extensions
(telescope.load_extension "env")
(telescope.load_extension "file_browser")
(telescope.load_extension "packer")
(telescope.load_extension "project")
(telescope.load_extension "tele_tabby")
(telescope.load_extension "ui-select")

(nvim.set_keymap :n :<leader>pf ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>p/ ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>bb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>h/ ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})

;; ;; TODO: define a picker that shows hidden files "--hidden" or files excluded by git (removing "!.git")
;; (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
;;                   :extensions {:ui-select {1 (themes.get_dropdown {})}
;;                                :project {}
;;                                }
;;                   :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})
