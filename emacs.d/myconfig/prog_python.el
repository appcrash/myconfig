(defun load-ropemacs ()
    (interactive)
    (if (eq system-type 'windows-nt)
            (setq pymacs-python-command "C:\\Python27\\python.exe"))
    (pymacs-load "ropemacs" "rope-")
    (setq ropemacs-enable-autoimport t)
    (add-to-list 'ac-sources 'ac-source-ropemacs)
)
                

(add-hook 'python-mode-hook '(lambda ()
    (fci-mode)
    (highlight-indentation-mode)
    (highlight-indentation-current-column-mode)
    (flymake-mode)
    (define-key python-mode-map "\C-m" 'newline-and-indent)
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)



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

(provide 'prog_python)


