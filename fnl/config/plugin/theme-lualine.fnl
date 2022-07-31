(module config.plugin.theme-lualine
  {autoload {core aniseed.core
             lualine lualine
             lsp config.plugin.lspconfig}})


;; Icon for LSP session
(defn lsp_connection []
  (if (vim.tbl_isempty (vim.lsp.buf_get_clients 0)) "" ""))


(lualine.setup
  {:options {:theme :newpaper
             :icons_enabled true
             :section_separators ["" ""]
             :component_separators ["" ""]}

   :sections {:lualine_a [[:mode {:upper true}]]
              :lualine_b [[:filename {:filestatus true
                                      :path 1}]]
              :lualine_c [[:branch]
                          [:diff
                           {:diff_color
                            {:added    :GitSignsAdd
                             :modified :GitSignsChange
                             :removed  :GitSignsDelete}
                            :symbols {:added " "
                                      :modified " "
                                      :removed " "}
                                  }]]
              :lualine_x [[:diagnostics
                           {:sections [:error :warn :info :hint]
                            :diagnostics_color
                            {:error :LualineDiagnosticError
                             :warn :LualineDiagnosticWarn
                             :info :LualineDiagnosticInfo
                             :hint :LualineDiagnosticHint}
                             :symbols {:error " "
                                       :warn " "
                                       :info " "
                                       :hint " "}
                             ;; :sources [:nvim_lsp]
                             :sources [:nvim_diagnostic]
                             }]
                          [lsp_connection]]
              :lualine_y [:location]
              :lualine_z [:filetype]}

   :inactive_sections {:lualine_a []
                       :lualine_b []
                       :lualine_c [[:filename {:filestatus true
                                               :path 1}]]
                       :lualine_x []
                       :lualine_y []
                       :lualine_z []}})
