(module config.plugin.theme
  {autoload {theme github-theme}})

;; Theme variants: dark/dimmed/dark_default/dark_colorblind/light/light_default/light_colorblind

;; Set theme - Neovim 9 onward
;; vim.cmd('colorscheme github_dark')

(theme.setup {;; :theme_style "dark"
              ;; :colors {:bg "#f8f2e6"}
              ;; :comment_style "italic"
              })
