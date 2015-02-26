;;
;; Key bindings
;;
(global-set-key (kbd "C-c b") 'ibuffer)
(global-set-key (kbd "s-g") 'goto-line)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "s-r") 'query-replace)
(global-set-key (kbd "s-o") 'ido-find-file)
(global-set-key (kbd "s-i") 'browse-url-at-point)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-word)
(global-set-key (kbd "C-M-s") 'instant-search-using-helm)
(global-set-key (kbd "C-M-S-s") 'helm-resume)
(global-set-key (kbd "C-M-g") 'instant-rgrep-using-helm)
(global-set-key (kbd "C-h s-f") 'find-function)
(global-set-key (kbd "C-h s-t") 'occur)
(global-set-key (kbd "S-s-a") 'align-regexp)
;; describe-bindings        C-h b
;; describe-mode            C-h m
;; describe-key             C-h k
;; kill-rectangle           C-x r k
;; yank-rectangle           C-x r y
;; insert-rectangle         C-x r t
;; delete-rectangle         C-x r d
;; open-rectangle           C-x r o
;; number-to-register       C-x r N
;; transpose-lines          C-x C-t
;; delete-indentation       M-^
;; kill-word                M-d
;; backward-kill-word       M-<DEL>
;; backward-kill-line       C-0 C-k
;; exchange-point-and-mark  C-x C-x
;; kill-region              C-w
;; downcase-region          C-x C-l
;; upcase-region            C-x C-u
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "<home>") 'otrenav-backward-left-bracket)
(global-set-key (kbd "<end>") 'otrenav-forward-right-bracket)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; describe-function F1 f
;; describe-key F1 k
;; describe-mode F1 m
;; describe-variable F1 v
;; describe-char
;; apropos-command F1 a


;;(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)

