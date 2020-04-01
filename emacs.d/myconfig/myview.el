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

; need to install doom-themes first
(load-theme 'doom-dark+ t)
(doom-modeline-mode 1)
(setq doom-modeline-minor-modes t)

;align emacs to middle screen
(add-hook 'after-init-hook
	  (let* (
		 (scale-factor 0.8)
		 (dw (display-pixel-width))
		 (dh (display-pixel-height))
		 (cw (frame-char-width))
		 (ch (frame-char-height))
		 (width (truncate (* (/ dw cw) scale-factor)))
		 (height (truncate (/ dh ch)))
		 (posx (truncate (* dw (/ (- 1 scale-factor) 2))))
		 (sf (selected-frame))
		 )
    	    (set-frame-size sf width height)
	    (set-frame-position sf posx 0)
	    ))

(provide 'myview)
