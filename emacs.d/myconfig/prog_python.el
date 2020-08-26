; install flymake-cursor in need mini buffer show errors

(setq python-indent-offset 4)

(if (eq system-type 'windows-nt)
    (setq python-shell-interpreter "C:\\Python27\\python.exe"))

; to use python3 as jedi intepreter, add following to .emacs.local
;(custom-set-variables '(jedi:server-command `("python3" ,jedi:server-script)))
(defun add-jedi-company ()
  (when (boundp 'company-backends)
    (add-to-list 'company-backends 'company-jedi)))

(add-hook 'python-mode-hook '(lambda ()
    (flymake-mode)
    (hs-minor-mode 't)
    (add-jedi-company)
    (delete-trailing-whitespace-local)
))


(cond ((eq system-type 'windows-nt) (setq pyflakes-cmd "C:\\Python27\\Scripts\\pyflakes.exe"))
      (t (setq pyflakes-cmd "pyflakes")))

(when (load "flymake" t)
         (defun flymake-pyflakes-init ()
           (let* ((temp-file (flymake-init-create-temp-buffer-copy
                              'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
             (list pyflakes-cmd (list local-file))))

         (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.py\\'" flymake-pyflakes-init)))

(setq python-indent-guess-indent-offset-verbose nil)

(provide 'prog_python)
