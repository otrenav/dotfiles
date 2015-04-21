;;
;; ESS
;;

;;
;; Modes
;;
(add-to-list 'auto-mode-alist '("/.R$'" . R-mode))
(add-to-list 'auto-mode-alist '("/.r$'" . R-mode))

(add-hook 'R-mode-hook 'imenu-add-menubar-index)
(setq ess-indent-level 4)
(setq ess-arg-function-offset 4)
(setq ess-else-offset 4)
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
(setq-default inferior-R-program-name "R")

;;
;; Match history (C-up) to written text
;;
(add-hook 'inferior-ess-mode-hook
          '(lambda nil
             (define-key inferior-ess-mode-map [\C-up]
               'comint-previous-matching-input-from-input)
             (define-key inferior-ess-mode-map [\C-down]
               'comint-next-matching-input-from-input)
             (define-key inferior-ess-mode-map [\C-x \t]
               'comint-dynamic-complete-filename)))
;;
;; Parser
;;
(defun ess-indent-region-as-R-function (beg end)
  (let ((string (replace-regexp-in-string
                 "\"" "\\\\\\&"
                 (replace-regexp-in-string ;; how to avoid this double matching?
                  "\\\\\"" "\\\\\\&" (buffer-substring-no-properties beg end))))
        (buf (get-buffer-create "*ess-command-output*")))
    (ess-force-buffer-current "Process to load into:")
    (ess-command (format "local({oo<-options(keep.source=FALSE);
cat('\n',paste(deparse(parse(text=\"%s\")[[1L]]),collapse='\n'),'\n',sep='')
options(oo)})\n"  string) buf)
    (with-current-buffer buf
      (goto-char (point-max))
      ;; (skip-chars-backward "\n")
      (let ((end (point)))
        (goto-char (point-min))
        (goto-char (1+ (point-at-eol)))
        (setq string (buffer-substring-no-properties (point) end))))
    (delete-region beg end)
    (insert string)))

(add-hook 'ess-mode-hook '(lambda () (set (make-local-variable 'indent-region-function)
                                          'ess-indent-region-as-R-function)))

;;
;; Keybindings
;;

