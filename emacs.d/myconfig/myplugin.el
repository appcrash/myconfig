(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)                       
(setq url-http-attempt-keepalives nil)

;ibuffer config
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

;highlight indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3f3f3")

;fill column indicator
(setq fci-rule-column 120)

;ido config
(require 'ido)
(ido-mode t)

; ecb config
;(setq ecb-tip-of-the-day nil)
;(global-ede-mode 1)
;(require 'ecb)

;auto complete config
(require 'auto-complete-config)
;(require 'ac-slime)
(setq ac-dwim t)
(setq ac-show-menu 0.1)
(ac-config-default)
(add-to-list 'ac-modes '(c-mode c++-mode java-mode common-lisp-mode))

;session config
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;yasnippet
(require 'yasnippet)
(yas--initialize)
(yas-global-mode 1)


;whitespace mode
;(require 'whitespace)
;(setq whitespace-line-column 120)
;(setq whitespace-style '(face empty lines-tail))

(provide 'myplugin)
