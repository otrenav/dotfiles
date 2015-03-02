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

;; (set-face-attribute 'ac-candidate-face nil
;;                     :background "#00222c"
;;                     :foreground "light gray")
;; (set-face-attribute 'ac-selection-face nil
;;                     :background "SteelBlue4"
;;                     :foreground "white")
;; (set-face-attribute 'popup-tip-face nil
;;                     :background "#003A4E"
;;                     :foreground "light gray")
