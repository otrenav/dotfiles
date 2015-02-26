;;
;; Automatic modes
;;
(add-to-list 'auto-mode-alist '("/.tex\\'" . latex-mode))
(add-to-list 'auto-mode-alist '("/.R\\'" . R-mode))
(add-to-list 'auto-mode-alist '("/.r\\'" . R-mode))
(add-to-list 'auto-mode-alist '("/emacs\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("/.m\\'" . matlab-mode))

;; TODO: Editorconfig
(require 'editorconfig)
(require 'diff-hl)
