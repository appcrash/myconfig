(add-hook 'erlang-mode-hook 
  (lambda ()
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
    (define-key erlang-mode-map "\C-m" 'newline-and-indent)
    (setq erlang-indent-level 2)))

(provide 'prog_erlang)
