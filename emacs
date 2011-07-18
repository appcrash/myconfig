(require 'cl)
(require 'compile)

(defconst INSTALL_DIR "/Applications/Emacs.app/Contents/Resources/")
(defconst SITE_DIR (concat INSTALL_DIR "site-lisp/"))

(add-to-list 'load-path "~/.emacs.d/myconfig/")

(require 'myfunc)
(require 'myplugin)
(require 'mykeymap)
(require 'myview)
(require 'mymisc)

(require 'prog_cpp)
(require 'prog_python)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left6")
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "DejaVu Sans Mono")))))
