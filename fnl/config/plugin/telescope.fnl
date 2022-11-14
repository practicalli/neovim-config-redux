(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             actions telescope.actions
             themes telescope.themes}})

(telescope.setup
  {:defaults {:file_ignore_patterns ["node_modules"]
              ;; Esc closes telescope popup immediately
              ;; otherwise Esc first goes to normal mode
              ;; :mappings {:i {:<esc> actions.close}}
              }
   :extensions {:file_browser {:hidden true}  ;; C-h/h toggle in popup
                :env {}
                :heading {:treesitter true}
                :ui-select {1 (themes.get_dropdown {})}
                :tele_tabby {:use_highlighter false}
                :packer {}
                :project {:sync_with_nvim_tree true}}
   :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git"]}}})

;; Load Extensions

;; List environment variables
(telescope.load_extension "env")

;; List headings with preview in markdown, asciidoc, etc.
(telescope.load_extension "heading")

;; File browsing - create files and directories
(telescope.load_extension "file_browser")


(telescope.load_extension "neoclip")

;; Manage packages
(telescope.load_extension "packer")

;; List network ports currently in use
(telescope.load_extension "ports")

;; Create, delete and switch between projects - setting path
(telescope.load_extension "project")

;; List currently open tabs and switch between them
(telescope.load_extension "tele_tabby")

;; Terraform
(telescope.load_extension "terraform_doc")


(telescope.load_extension "ui-select")

;; ;; TODO: define a picker that shows hidden files "--hidden" or files excluded by git (removing "!.git")
;; (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
;;                   :extensions {:ui-select {1 (themes.get_dropdown {})}
;;                                :project {}
;;                                }
;;                   :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})
