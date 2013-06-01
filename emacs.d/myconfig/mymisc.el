;desktop config
;(desktop-save-mode t)
(setq desktop-path             (list "~/.emacs.d/desktop/")
	  desktop-dirname          "~/.emacs.d/desktop/"
	  desktop-base-file-name   "emacs.desktop"
	  desktop-save             t)
      
(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))
      
;bookmark config
(setq bookmark-default-file "~/.emacs.d/bookmark")

; take the short answer, y/n is yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;get rid of the prompt every time start making
(setq compilation-read-command nil)
;automatic saving file before compile
(setq compilation-ask-about-save nil)
;remember recent file
(recentf-mode 1)

;disable create backup files like
(setq backup-inhibited t)

;the annoying autosave files directory, *NOTE* the directory must exist!
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-files/" t)))


(provide 'mymisc)
