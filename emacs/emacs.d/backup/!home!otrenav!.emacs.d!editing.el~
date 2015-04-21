;;
;; Editing
;;

;;
;; Automatic modes
;;
(add-to-list 'auto-mode-alist '("/.zsh$" . shell-script-mode))
;;(add-to-list 'auto-mode-alist '("/.gitconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("/.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("/.mdown$" . markdown-mode))

;; TODO: Editorconfig
(require 'editorconfig)
(require 'diff-hl)

;;
;; Backups
;;
;;(setq backup-directory-alist `((".*" . , temporary-file-directory)))
;;(setq auto-save-file-name-transforms `((".*" , temporary-file-directory t)))

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
