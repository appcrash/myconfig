(add-to-list 'load-path (concat SITE_DIR "slime/"))  
(setq inferior-lisp-program "/usr/local/bin/sbcl") 
(require 'slime-autoloads)
(slime-setup '(slime-scratch slime-editing-commands slime-fancy))

(provide 'prog_lisp)


