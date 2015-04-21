;;
;; Lisp
;;

;;
;; Modes
;;
(add-to-list 'auto-mode-alist '("/.el$'" . emacs-lisp-mode))

(setq lisp-modes '(lisp-mode
                   emacs-lisp-mode
                   common-lisp-mode
                   scheme-mode
                   clojure-mode))

(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)

;;
;; Keybindings
;;
