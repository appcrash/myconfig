(add-hook 'erlang-mode-hook
  (lambda ()
    (delete-trailing-whitespace-local)
    (define-key erlang-mode-map "\C-m" 'newline-and-indent)
    (setq erlang-indent-level 2)))

(provide 'prog_erlang)
