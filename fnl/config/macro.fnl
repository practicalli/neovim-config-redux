;; https://github.com/D00mch/dotfiles/blob/master/.config/nvim/fnl/macros.fnl

{:augroup
 (fn [name ...]
    `(do
        (nvim.ex.augroup ,(tostring name))
        (nvim.ex.autocmd_)
        ,(list `do ...)
        (nvim.ex.augroup :END)))

 :autocmd
 (fn [...]
    `(nvim.ex.autocmd ,...))}
