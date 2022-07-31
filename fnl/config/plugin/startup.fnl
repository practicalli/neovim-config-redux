(module config.plugin.startup
  {autoload {startup startup
             functions startup_nvim.functions}})

;; https://github.com/startup-nvim/startup.nvim

(startup.setup
 {:logo-neovim
  {:type "text"
   :oldfiles_directory false
   :align "center"
   :title "Header"
   :margin 5
   :content
   [ " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
     " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
     " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
     " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
     " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
     " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"]
    :highlight "TSTag"
    :default_color ""
    :oldfiles_amount 0}

  :logo-lambda
  {:type "text"
   :oldfiles_directory false
   :align "center"
   :title "Header"
   :margin 5
   :content
   ["⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
    "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ "
    "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ "
    "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ "
    "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ "
    "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ "
    "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ "
    "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ "
    "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ "
    "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ "
    "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ "
    "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ "
    "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ "
    "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ "
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "]
    :highlight "TSTag"
    :default_color ""
    :oldfiles_amount 0}

  :header
  {:type "text"
   :oldfiles_directory false
   :align "center"
   :title "Header"
   :margin 5
   :content ["practical.li/neovim"
             "Spiced Neovim - a Fennel driven experience"]
    :highlight "Function"
    :default_color ""
    :oldfiles_amount 0}

  :menu
  {:type "mapping"
   :oldfiles_directory false
   :align "center"
   :fold_section false
   :title "Command Menu"
   :margin 5
   :content [[" File Browser" "Telescope file_browser" "<leader>ff"]
             [" Find File" "Telescope find_files" "<leader>pf"]
             [" Find Word" "Telescope live_grep" "<leader>lg"]
             [" Recent Files" "Telescope oldfiles" "<leader>of"]
             [" Colorschemes" "Telescope colorscheme" "<leader>cs"]
             [" New File" "lua require'startup'.new_file()" "<leader>nf"]]
   :highlight "String"
   :default_color ""
   :oldfiles_amount 0}

  :footer
  {:type "text"
   :oldfiles_directory false
   :align "center"
   :title "Footer"
   :margin 5
   :content [" practicalli 2022"
             " Creative Commons Attribution Share-Alike"]
   :highlight "Function"
   :default_color ""
   :oldfiles_amount 0}

  :options
  {:mapping_keys true
   :cursor_column 0.5
   :empty_lines_between_mappings true
   :paddings [1 3 3 0]}

  :mappings
  {:execute_command "<CR>"
   :open_file "o"
   :open_file_split "<c-o>"
   :open_section "<TAB>"
   :open_help "?"}

  :colors
  {:background "#f8f2e6"
   :folded_section "#56b6c2" }

  :parts [:logo-lambda :header :menu :footer]
})
