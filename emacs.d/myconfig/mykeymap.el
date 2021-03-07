;remap the mac key
(setq mac-option-modifier 'control)
;(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;remap win key
(setq
    w32-pass-lwindow-to-system nil
    w32-pass-rwindow-to-system nil
    w32-pass-apps-to-system nil
    w32-lwindow-modifier 'super ; Left Windows key
    w32-rwindow-modifier 'super ; Right Windows key
    ;w32-apps-modifier 'hyper
    w32-apps-modifier 'super)

;keymaping
(global-set-key (kbd "C-;") 'previous-user-buffer)
(global-set-key (kbd "C-'") 'next-user-buffer)
(global-set-key (kbd "C-`") 'other-window)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key (kbd "C-,") 'point-to-register)
(global-set-key (kbd "C-.") 'jump-to-register)
(global-set-key (kbd "C-L") 'kill-whole-line)
(global-set-key (kbd "C-Z") 'undo)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-o") 'switch-to-recent-buffer)
(global-set-key (kbd "C-o") 'vim-like-open-line)
(global-set-key (kbd "C-M-o") 'open-line)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "<f5>") 'compile-safely-with-flymake)
(global-set-key (kbd "S-<f11>") 'desktop-save-in-desktop-dir)
(global-set-key (kbd "<f11>") 'desktop-read)
(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "C-S-o") 'pop-global-mark)
(global-set-key (kbd "M-W") 'kill-region)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "M-x") 'try-helm-M-x) ;; caution!


;super key
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-g") 'switch-to-buffer)
(global-set-key (kbd "s-s") 'rgrep)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-below)

;latex mode
(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key [C-tab] 'TeX-complete-symbol)
        (local-set-key [f5] (lambda () 
            (interactive)
            (save-buffer)
            (TeX-command-run-all nil)))))

;python mode
(add-hook 'python-mode-hook '(lambda ()
    (define-key python-mode-map "\C-m" 'newline-and-indent)
))

;lua mode
(add-hook 'lua-mode-hook '(lambda ()
    (define-key lua-mode-map "\C-m" 'newline-and-indent)
    ))

;org mode
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file (get_mytodo_file))))
(add-hook 'org-mode-hook (lambda ()
  	(local-set-key "\C-cl" 'org-store-link)
	(local-set-key "\C-cc" 'org-capture)
	(local-set-key "\C-ca" 'org-agenda)
	(local-set-key "\C-cb" 'org-iswitchb)
))

;hs minor mode
(add-hook 'hs-minor-mode-hook (lambda ()
    (local-set-key (kbd "M-\/") 'hs-toggle-hiding)
    (local-set-key (kbd "C-M-\/") 'hs-hide-all)
))

;smartparens
(define-key smartparens-mode-map (kbd "C-M-a") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-M-e") 'sp-end-of-sexp)


(defun bind-switch-between-header-impl ()
    (local-set-key (kbd "C-M-;") 'ff-find-other-file))

(defun bind-rtags-keymapping ()
    (local-set-key (kbd "C-M-j") 'rtags-find-symbol-at-point)
    (local-set-key (kbd "C-M-r") 'rtags-rename-symbol))

(provide 'mykeymap)
