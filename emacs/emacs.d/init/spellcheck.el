;;
;; Spell check
;;
(require 'flyspell-lazy)
(flyspell-lazy-mode t)
(setq ispell-program-name "/opt/local/bin/aspell")
(setq ispell-program-name "aspell")

(dolist (mode '(emacs-lisp-mode-hook
                latex-mode-hook
                python-mode-hook
                R-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode))))

(defun flyspell-check-next-word ()
  "Spell check next word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))
