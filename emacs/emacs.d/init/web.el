;;
;; Web
;;

;;
;; Modes
;;


;;
;; HTML
;;
(setq sgml-basic-offset 4)
(defun otrenav-syntax-color-hex ()
  "Syntax color hex color spec such as 「#ff1100」 in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer)
  )

(add-hook 'css-mode-hook 'otrenav-syntax-color-hex)
(add-hook 'php-mode-hook 'otrenav-syntax-color-hex)
(add-hook 'html-mode-hook 'otrenav-syntax-color-hex)

;;
;; JavaScript
;;
(setq js-indent-level 4)

;;
;; CSS
;;