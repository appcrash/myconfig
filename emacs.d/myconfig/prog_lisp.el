(add-to-list 'load-path (concat SITE_DIR "slime/"))  
(setq inferior-lisp-program "/usr/local/bin/sbcl") 
(require 'slime-autoloads)
(slime-setup '(slime-scratch slime-editing-commands slime-fancy))

(add-hook 'slime-mode-hook
		  (lambda ()		  
            (set-up-slime-ac)
            (define-key slime-mode-map "\r" 'newline-and-indent)
			(define-key slime-mode-map "\C-c\C-q" 'slime-close-all-parens-in-sexp)))

(add-to-list 'ac-modes 'lisp-mode)

(provide 'prog_lisp)


