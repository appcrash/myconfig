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

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop
			for d = default-directory then (expand-file-name ".." d)
			if (file-exists-p (expand-file-name file d))
			return d
			if (equal d root)
			return nil))))

(defun compile-safely-with-flymake ()
  "disable flymake before compiling, and restore the state when done"
  (interactive)
  (if (local-variable-p 'flymake-mode (current-buffer))
	  (progn (flymake-mode 0)
			 (call-interactively 'flymake-compile)
			 (flymake-mode 1))
	(call-interactively 'compile)))

(defun switch-to-recent-buffer ()
  "switch to the most recent buffer."
  (interactive)
  (switch-to-buffer (other-buffer))
)

(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let ((attributes (process-attributes pid)) (cmd))
      (dolist (attr attributes)
        (if (string= "comm" (car attr))
            (setq cmd (cdr attr))))
      (if (and cmd (or (string= "emacs" cmd) (string= "emacs.exe" cmd))) t))))

(defun delete-trailing-whitespace-local ()
  "Delete trailing white space in local hook other than gloal one."
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))

(defun vim-like-open-line ()
  "Open a line above and indent smart indent to first non-tab character."
  (interactive)
  (back-to-indentation)
  (split-line))






(provide 'myfunc)
