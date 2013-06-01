;show the line number
(global-linum-mode t)
;always highlight the matching parentheses
(show-paren-mode t)

;don't show the toolbar and menu, save the space for editing
(tool-bar-mode -1)
(menu-bar-mode -1)

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-subtle-hacker)


(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left. 100))

(provide 'myview)


