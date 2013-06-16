; install rope,ropemacs, and pymacs in python, use the latest pymacs if in windows
; install pymacs in emacs
; install flymake-cursor in need mini buffer show errors

(setq python-indent-offset 4)

(if (eq system-type 'windows-nt)
    (setq python-shell-interpreter "C:\\Python27\\python.exe"))

(defun load-ropemacs ()
    ;(interactive)
    (if (eq ropemacs-loaded 0)
        (progn
            (if (eq system-type 'windows-nt)
                    (setq pymacs-python-command python-shell-interpreter))
            (setq pymacs-load-history nil)
            (pymacs-load "ropemacs" "rope-")
            (setq ropemacs-enable-autoimport t)
            (setq ropemacs-loaded 1)))
        
    (ropemacs-mode)
    ;(add-to-list 'ac-sources 'ac-source-ropemacs)
)


                

(add-hook 'python-mode-hook '(lambda ()
    (load-ropemacs)
    (flymake-mode)
    (define-key python-mode-map "\C-m" 'newline-and-indent)
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq ropemacs-loaded 0)


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


