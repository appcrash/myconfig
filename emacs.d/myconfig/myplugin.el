(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(setq url-http-attempt-keepalives nil)

;ibuffer config
(require 'ibuf-ext)
;(add-to-list 'ibuffer-never-show-predicates "^\\*")
(setq ibuffer-saved-filter-groups
  (quote (("default"
    ("Programming" ;; prog stuff not already in MyProjectX
     (or
      (mode . c-mode)
      (mode . c++-mode)
      (mode . python-mode)
      (mode . emacs-lisp-mode)
      (mode . lisp-mode)
      (mode . lua-mode)
      (mode . sql-mode)
      (mode . html-mode)
      (mode . makefile-gmake-mode)
      (mode . yaml-mode)
      (mode . sh-mode)
      ;; etc
      ))
    ("Dired"
     (or
      (mode . dired-mode)))
    ("Org" ;; all org-related buffers
     (or
      (mode . org-mode)
      (mode . org-agenda-mode)
      (mode . diary-mode)
      (mode . calendar-mode)
      (name . "^*Fancy Diary")
      ))
    ("Emacs"
     (or
      (name . "^\\*scratch\\*$")
      (name . "^\\*Messages\\*$")
      (name . "^\\*ielm\\*$")
      (mode . help-mode)))
    ))))
(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

;highlight indentation
;(require 'highlight-indentation)
;(set-face-background 'highlight-indentation-face "#e3e3d3")
;(set-face-background 'highlight-indentation-current-column-face "#c3f3f3")


;ido config
(require 'ido)
(ido-mode t)

; ecb config
;(setq ecb-tip-of-the-day nil)
;(global-ede-mode 1)
;(require 'ecb)

;auto complete config
(require 'auto-complete-config)
(setq ac-dwim t)
(setq ac-show-menu 0.1)
(setq ac-fuzzy-enable t)
(ac-config-default)
(add-to-list 'ac-modes '(c-mode c++-mode java-mode lisp-mode common-lisp-mode erlang-mode org-mode))

;session config
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;whitespace mode
;(require 'whitespace)
;(setq whitespace-line-column 120)
;(setq whitespace-style '(face empty lines-tail))

(provide 'myplugin)
