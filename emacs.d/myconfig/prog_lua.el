(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook '(lambda ()
    (define-key lua-mode-map "\C-m" 'newline-and-indent)
))

(provide 'prog_lua)