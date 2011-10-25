;cedet config, Emacs 23.2 buit-in cedet has problems
;download cedet and compile
(load-file (concat SITE_DIR "cedet-1.0/common/cedet.elc"))
(require 'cedet)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(require 'semantic-decorate-include)
(semantic-add-system-include "~/dev/plasticine/inc/")

;ibuffer config
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

; ecb config
(setq ecb-tip-of-the-day nil)
(global-ede-mode 1)
(require 'ecb)

;auto complete config
(require 'auto-complete-config)
(setq ac-dwim t)
(setq ac-show-menu 0.1)
(add-to-list 'ac-dictionary-directories
	     (concat SITE_DIR "auto-complete/ac-dict"))
(ac-config-default)

;session config
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;yasnippet
(add-to-list 'load-path "~/.emacs.d/yas")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yas/snippets")

;auto generate member function from c++ header file
(require 'member-function)

(provide 'myplugin)
