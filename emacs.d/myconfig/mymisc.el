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

;open new file without "confirm" prompt
(setq confirm-nonexistent-file-or-buffer nil)

;the annoying autosave files directory, *NOTE* the directory must exist!
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-files/" t)))

;always keep file in sync
(global-auto-revert-mode t)

;disable creating lock files like ".#xxxx"
(setq create-lockfiles nil)

(defadvice shell-quote-argument (after windows-nt-special-quote (argument) activate)
     "Add special quotes to ARGUMENT in case the system type is 'windows-nt. REQUIRED BY rgrep under windows"
     (when
         (and (eq system-type 'windows-nt) (w32-shell-dos-semantics))
       (if (string-match "[\\.~]" ad-return-value)
           (setq ad-return-value
	        (replace-regexp-in-string
	         "\\([\\.~]\\)"
	         "\\\\\\1"
	         ad-return-value)))))

;disable recentering when scrolling
(setq scroll-conservatively 101)

(provide 'mymisc)
