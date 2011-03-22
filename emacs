(defconst INSTALL_DIR "/Applications/Emacs.app/Contents/Resources/")
(defconst SITE_DIR (concat INSTALL_DIR "site-lisp/"))

;remap the mac key
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)

;show the line number
(global-linum-mode t)
;always highlight the matching parentheses
(show-paren-mode t)

;cedet config, Emacs 23.2 buit-in cedet has problems
;download cedet and compile
(load-file (concat SITE_DIR "cedet-1.0/common/cedet.elc"))
(require 'cedet)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(require 'semantic-decorate-include)
(semantic-add-system-include "~/dev/plasticine/inc/")

;ibuffer config
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

; ecb config
(setq ecb-tip-of-the-day nil)
(global-ede-mode 1)
(require 'ecb)

;auto complete config
(require 'auto-complete-config)
(setq ac-dwim t)
(setq ac-show-menu 0.1)
(add-to-list 'ac-dictionary-directories
	     (concat SITE_DIR "auto-complete/ac-dict"))
(ac-config-default)

;desktop config
(desktop-save-mode t)
(setq desktop-path             (list "~/.emacs.d/desktop/")
	  desktop-base-file-name   "emacs.desktop"
	  desktop-save             t)

;bookmark config
(setq bookmark-default-file "~/.emacs.d/bookmark")

(require 'color-theme)
(color-theme-subtle-hacker)

;session config
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;yasnippet
(add-to-list 'load-path "~/.emacs.d/yas")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yas/snippets")

;======= customized functions =======
(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

;======= programming settings =======
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; treat all *.h files as c++ header files
(setq default-tab-width 4)
(setq tab-width 4)

(defconst c-style
  '("k&r"  ; the base style inherits from
	(c-basic-offset . 4)
    (c-cleanup-list . (brace-else-brace
                       brace-elseif-brace
                       empty-defun-braces   ; if function def is empty, compact the braces together
                       defun-close-semi)))
)
(c-add-style "c-style" c-style)

(defconst c++-style
  '("c-style"
	(c-offsets-alist . ((inline-open . 0))))   ; the in-class def looks like class def other than substatement
)

(c-add-style "c++-style" c++-style)

(add-hook 'c-mode-common-hook (lambda ()
								(add-hook 'before-save-hook 'delete-trailing-whitespace) ; avoid trailing space
								(setq indent-tabs-mode nil) ; replace tab with space
								(c-toggle-hungry-state)
								(c-toggle-auto-newline)))


(add-hook 'c-mode-hook (lambda ()
						        (c-set-style "c-style")))

(add-hook 'c++-mode-hook (lambda ()
						        (c-set-style "c++-style")))

;get rid of the prompt every time start making
(setq compilation-read-command nil)

;keymaping
(global-set-key (kbd "C-;") 'previous-user-buffer)
(global-set-key (kbd "C-'") 'next-user-buffer)
(global-set-key (kbd "C-`") 'other-window)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key (kbd "C-,") 'point-to-register)
(global-set-key (kbd "C-.") 'jump-to-register)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "<f5>") 'compile)


;disable create backup files like
(setq backup-inhibited t)

;the annoying autosave files directory, *NOTE* the directory must exist!
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-files/" t)))




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
