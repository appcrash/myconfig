(setq org-root "c:/Users/yh/Dropbox/Apps/MobileOrg/")
(defvar mytodo_file (concat org-root "todo.org")) 

(add-hook 'after-init-hook (lambda ()
    (setq org-agenda-files  (list mytodo_file))
    (setq org-default-notes-file (concat org-root "note.org"))
    (setq org-log-done t)))
  

(provide 'prog_org)
