;======= programming settings =======
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; treat all *.h files as c++ header files
(setq default-tab-width 4)
(setq tab-width 4)
(setq ff-search-directories '("." "../inc/*" "../src/*")) ; searching path when switching between .h and .cpp by ff-find-other-file

(defconst c-style
 '("k&r"  ; the base style inherits from
     (c-basic-offset . 4)
     (c-cleanup-list . (brace-else-brace
                        brace-elseif-brace
                        ;empty-defun-braces   ; if function def is empty, compact the braces together
                        defun-close-semi)))
 )
(c-add-style "c-style" c-style)

(defconst c++-style
 '("c-style"
     (c-offsets-alist . ((inline-open . 0))))   ; the in-class def looks like class def other than substatement
 )

(c-add-style "c++-style" c++-style)

(add-hook 'c-mode-common-hook
	  (lambda ()
        (hs-minor-mode 't)
	    (delete-trailing-whitespace-local) ; avoid trailing space
	    (setq indent-tabs-mode nil) ; replace tab with space
	    (set (make-local-variable 'compile-command) (format "make -f %s"  (get-closest-pathname))) ; use the closest makefile
        (bind-rtags-keymapping)
	    (c-toggle-hungry-state)
	    (c-toggle-auto-newline)
        (bind-switch-between-header-impl)
        (c-toggle-comment-style 1)  ; use block comment
))


(add-hook 'c-mode-hook
	  (lambda ()
	    (c-set-style "c-style")))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-style "c++-style")))

(provide 'prog_cpp)
