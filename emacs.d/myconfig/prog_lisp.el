(cond
   ((eq system-type 'windows-nt) (setq inferior-lisp-program (concat (getenv "SBCL_HOME") "\\sbcl.exe")))
   (t (setq inferior-lisp-program "sbcl")))

;(require 'slime-autoloads)
;(slime-setup '(slime-scratch
;               slime-editing-commands
;               slime-indentation
;               slime-presentations
;               slime-references
;               slime-repl))
     
(add-to-list 'auto-mode-alist '("\\.cl$" . common-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . common-lisp-mode))

(add-hook 'slime-mode-hook
		  (lambda ()		  
            (set-up-slime-ac)
            (define-key slime-mode-map "\r" 'newline-and-indent)
			(define-key slime-mode-map "\C-c\C-q" 'slime-close-all-parens-in-sexp)))

(provide 'prog_lisp)


