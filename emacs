
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(require 'cl)
(require 'compile)

(defconst INSTALL_DIR "/Applications/Emacs.app/Contents/Resources/")
(defconst SITE_DIR (concat INSTALL_DIR "site-lisp/"))
(add-to-list 'load-path "~/.emacs.d/myconfig/")

(setq default-directory "~/develop")
(if (eq system-type 'windows-nt)
	(progn
		(setenv "PATH" (concat "D:/develop/myconfig/emacs.d/binary;" (getenv "PATH")))
		(setq default-directory "d:/")))

(require 'myfunc)
(require 'myplugin)
(require 'mymisc)

(require 'prog_cpp)
(require 'prog_python)
(require 'prog_lisp)
(require 'prog_lua)
(require 'prog_org)
(require 'prog_erlang)
(require 'prog_latex)


(require 'mykeymap)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote bar))
 '(ecb-layout-name "left6")
 '(ecb-options-version "2.40")
 '(initial-buffer-choice t)
 '(jedi:environment-virtualenv (quote ("virtualenv" "-p" "/usr/bin/python3")))
 '(package-selected-packages
   (quote
    (idle-highlight-in-visible-buffers-mode highlight-symbol helm company-jedi pymacs company-rtags company doom-modeline doom-themes smartparens auctex geiser flycheck jedi yasnippet-snippets slime session elisp-slime-nav)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Noto Mono")))))



; let local version of ".emacs" to override my default config
; it exists due to OS/Machine Env variation
(load-dot-emacs-local)

; ensure myview comes last, otherwise the size isn't correct
(require 'myview)
