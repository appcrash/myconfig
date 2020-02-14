(cond
   ((eq system-type 'windows-nt) (setq inferior-lisp-program (concat (getenv "SBCL_HOME") "\\sbcl.exe")))
   ((eq system-type 'darwin) (setq inferior-lisp-program "/usr/local/bin/sbcl"))
   (t (setq inferior-lisp-program "/usr/bin/sbcl")))

; download slime from official site instead of using emacs package install
(add-to-list 'load-path "~/.emacs.d/myconfig/slime-2013-04-05")
(when (load "slime-autoloads" t)
    (setq slime-auto-connect 'always)
    (slime-setup '(slime-fancy)))

(require 'ac-slime)

(add-to-list 'auto-mode-alist '("\\.cl$" . common-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . common-lisp-mode))

(add-hook 'slime-mode-hook
		  (lambda ()
            (set-up-slime-ac)
            (define-key slime-mode-map "\r" 'newline-and-indent)
			(define-key slime-mode-map "\C-c\C-q" 'slime-close-all-parens-in-sexp)))


(mapcar (lambda (hook)
       (add-hook hook (lambda () (delete-trailing-whitespace-local))))
     (list 'emacs-lisp-mode-hook 'list-mode-hook 'scheme-mode-hook))


(provide 'prog_lisp)
