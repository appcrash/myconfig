;show the line number
(global-linum-mode t)
;always highlight the matching parentheses
(show-paren-mode t)

;desktop config
(desktop-save-mode t)
(setq desktop-path             (list "~/.emacs.d/desktop/")
	  desktop-base-file-name   "emacs.desktop"
	  desktop-save             t)

;bookmark config
(setq bookmark-default-file "~/.emacs.d/bookmark")


;get rid of the prompt every time start making
(setq compilation-read-command nil)


;disable create backup files like
(setq backup-inhibited t)

;the annoying autosave files directory, *NOTE* the directory must exist!
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-files/" t)))


(provide 'mymisc)