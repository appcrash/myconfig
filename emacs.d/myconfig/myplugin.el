(require 'package)
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("melpa" . "https://stable.melpa.org/packages/")))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)
;(setq url-http-attempt-keepalives nil)

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
      (mode . erlang-mode)
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



;ido config
(require 'ido)
(setq ido-auto-merge-work-directories-length -1) ; disable suggestions
(ido-mode t)


;auto complete config
;(require 'auto-complete-config)
;(setq ac-dwim t)
;(setq ac-show-menu 0.1)
;(setq ac-fuzzy-enable t)
;(ac-config-default)
;(dolist (m '(c-mode c++-mode java-mode lisp-mode common-lisp-mode erlang-mode org-mode))
;    (add-to-list 'ac-modes m))

;company mode
(require 'company)
(global-company-mode)
(setq company-idle-delay 0)

;session config
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (append yas-snippet-dirs "~/.emacs.d/snippets"))

;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;flyspell
(dolist (hook '(LaTeX-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;idle-highlight-mode
(require 'idle-highlight-in-visible-buffers-mode)
(dolist (hook '(c-mode-common-hook python-mode-hook erlang-mode-hook))
  (add-hook hook (lambda () (idle-highlight-in-visible-buffers-mode t))))
(add-hook 'window-configuration-change-hook (lambda () (set-face-attribute 'idle-highlight-in-visible-buffers nil :foreground "yellow"
		    :background (face-attribute 'default :background) :weight 'ultra-bold :underline t)))

;smartparens
(require 'smartparens)
(dolist (hook '(c-mode-common-hook python-mode-hook org-mode-hook LaTeX-mode-hook))
  (add-hook hook (lambda () (smartparens-mode))))
(sp-local-pair '(c-mode c++-mode) "{" nil :actions nil) ; disable "{}" auto pair as it may conflict with cedet

;rtags
(require 'company-rtags)
(dolist (hook '(c-mode-common-hook))
  (add-hook hook (lambda () 
    (push 'company-rtags company-backends)
)))
(setq rtags-completions-enabled t)


;geiser for scheme(local)
;(setq geiser-active-implementations '(chez))
;(setq geiser-scheme-implementation 'chez)
;(setq geiser-chez-binary "/usr/local/bin/chez-scheme")


(provide 'myplugin)
