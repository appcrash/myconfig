
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
(require 'mykeymap)
(require 'myview)
(require 'mymisc)

(require 'prog_cpp)
(require 'prog_python)
(require 'prog_lisp)
(require 'prog_lua)
(require 'prog_org)
(require 'prog_erlang)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote bar))
 '(ecb-layout-name "left6")
 '(ecb-options-version "2.40")
 '(initial-buffer-choice t)
 '(package-selected-packages
   (quote
    (pymacs flycheck ac-slime jedi yasnippet-snippets slime session elisp-slime-nav auto-complete)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "DejaVu Sans Mono")))))
