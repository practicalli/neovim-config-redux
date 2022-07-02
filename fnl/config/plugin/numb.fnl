(module config.plugin.numb
  {autoload {numb numb}})

;; https://github.com/nacro90/numb.nvim

(numb.setup {:show_numbers true
             :show_cursorline true
             :number_only true
             :centered_peeking true})
