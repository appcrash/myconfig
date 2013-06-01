;show the line number
(global-linum-mode t)
;always highlight the matching parentheses
(show-paren-mode t)

;don't show the toolbar and menu, save the space for editing
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq custom-theme-directory "~/.emacs.d/myconfig/")
;(load-theme 'tsdh-dark)
(add-hook 'after-init-hook
          (lambda ()
            (progn
              (set-foreground-color "white")  
              (set-background-color "gray15"))))

(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left. 100))

(provide 'myview)


