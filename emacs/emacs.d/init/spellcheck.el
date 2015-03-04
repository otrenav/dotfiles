;;
;; Flyspell
;;

(require 'flyspell-lazy)
(flyspell-lazy-mode t)
(setq flyspell-issue-welcome-flag nil)

(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))

(setq-default ispell-list-command "list")

;; TODO: Add other programming languages
(dolist (mode '(emacs-lisp-mode-hook
                latex-mode-hook
                python-mode-hook
                R-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode))))

(defun flyspell-check-next-word ()
  "Spell check next word."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

;; TODO: What is this?
;; (eval-after-load "flyspell"
;;   '(progn
;;      (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
;;      (define-key flyspell-mouse-map [mouse-3] #'undefined)))

;; TODO: Add other languages
