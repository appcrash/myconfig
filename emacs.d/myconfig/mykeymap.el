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
(global-set-key (kbd "<f5>") 'compile)

(provide 'mykeymap)