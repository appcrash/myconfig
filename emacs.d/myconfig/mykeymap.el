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


;super key
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-g") 'switch-to-buffer)
(global-set-key (kbd "s-s") 'rgrep)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-below)

(defun bind-switch-between-header-impl ()
    (local-set-key (kbd "C-M-;") 'ff-find-other-file))

(provide 'mykeymap)
