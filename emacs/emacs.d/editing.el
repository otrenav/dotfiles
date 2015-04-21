;;
;; Editing
;;

;;
;; Automatic modes
;;
(add-to-list 'auto-mode-alist '("/.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("/.mdown$" . markdown-mode))

;; Editorconfig
(require 'editorconfig)
(require 'diff-hl)

;;
;; Others
;;
(require 'autopair)
(require 'auto-complete-config)
(ac-config-default)

;;
;; Clean up
;;
(setq-default show-trailing-whitespace t)

;;
;; Markdown
;;
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
