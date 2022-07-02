# Notes

example plugins and configuration
https://medium.com/geekculture/neovim-configuration-for-beginners-part-two-fb3834da91b8


autocommand runs commands when creating a buffer

If you want to know more about anything on vim, just use :help name


## Keybindings


```
inoremap: maps the key in insert mode
nnoremap: maps the key in normal mode
vnoremap: maps the key in visual mode
```
<C> : represents Control key
<A> : Alt key

" copies filepath to clipboard by pressing yf
```
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
```

" copies pwd to clipboard: command yd
```
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
```

" Vim jump to the last position when reopening a file
```
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
```
