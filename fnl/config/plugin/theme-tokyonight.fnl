(module config.plugin.theme-tokyonight
  {autoload {tokyo tokyonight}})

;; https://github.com/folke/tokyonight.nvim

(tokyo.setup
 {:tokyonight_style "storm"})


  ;; theme styles: "storm", "night", "day"
  ;; :tokyonight_style "storm"
  ;; :tokyonight_terminal_colors true
  ;; :tokyonight_italic_comments true
  ;; :tokyonight_italic_keywords true
  ;; :tokyonight_italic_functions false
  ;; :tokyonight_italic_variables false
  ;; :tokyonight_transparent false

  ;; replace inactive statuslines with thin border
  ;; :tokyonight_hide_inactive_statusline false

  ;; Set darker background on sidebar-like windows. e.g. ["qf", "vista_kind", "terminal", "packer"]
  ;; :tokyonight_sidebars {}

  ;; Sidebar like windows like NvimTree get a transparent background
  ;; :tokyonight_transparent_sidebar false

  ;; Sidebar like windows like NvimTree get a darker background
  ;; :tokyonight_dark_sidebar true

  ;; Float windows like the lsp diagnostics windows get a darker background
  ;; :tokyonight_dark_float true

  ;; You can override specific color groups to use other groups or a hex color
  ;; :tokyonight_colors {}

  ;; Adjust brightness of Day style colors, range 0 dull to 1 vibrant
  ;; :tokyonight_day_brightness 0.3

  ;; When true, section headers in the lualine theme will be bold
  ;; :tokyonight_lualine_bold false
