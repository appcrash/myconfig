(setq org-root "c:/Users/yh/Dropbox/Apps/MobileOrg/")
(defun get_mytodo_file () (concat org-root "todo.org"))

(add-hook 'after-init-hook (lambda ()
    (setq org-agenda-files (list (get_mytodo_file)))
    (setq org-default-notes-file (concat org-root "note.org"))
    (setq org-log-done t)))
  

(provide 'prog_org)
