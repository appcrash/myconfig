;remap the mac key
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)

;keymaping
(global-set-key (kbd "C-;") 'previous-user-buffer)
(global-set-key (kbd "C-'") 'next-user-buffer)
(global-set-key (kbd "C-`") 'other-window)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key (kbd "C-,") 'point-to-register)
(global-set-key (kbd "C-.") 'jump-to-register)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-o") 'switch-to-recent-buffer)
(global-set-key (kbd "C-o") 'split-line)
(global-set-key (kbd "C-M-o") 'open-line)
(global-set-key (kbd "<f5>") 'compile-safely-with-flymake)
(global-set-key (kbd "<f11>") 'desktop-save-in-desktop-dir)
(global-set-key (kbd "<f12>") 'desktop-read)

(defun bind-switch-between-header-impl ()
    (local-set-key (kbd "C-M-;") 'ff-find-other-file))

(provide 'mykeymap)
