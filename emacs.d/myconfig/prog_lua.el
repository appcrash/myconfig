(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook '(lambda ()
    (define-key lua-mode-map "\C-m" 'newline-and-indent)
    (highlight-indentation-mode)
    (highlight-indentation-current-column-mode)
))

(provide 'prog_lua)