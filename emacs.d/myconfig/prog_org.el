(setq org-root "c:/Users/yh/Dropbox/Apps/MobileOrg/")
(setq mytodo_file (concat org-root "todo.org"))
(setq org-agenda-files  (list mytodo_file))
(setq org-default-notes-file (concat org-root "note.org"))

(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file mytodo_file)))

(add-hook 'org-mode-hook (lambda ()
  	(local-set-key "\C-cl" 'org-store-link)
	(local-set-key "\C-cc" 'org-capture)
	(local-set-key "\C-ca" 'org-agenda)
	(local-set-key "\C-cb" 'org-iswitchb)
))


(provide 'prog_org)
