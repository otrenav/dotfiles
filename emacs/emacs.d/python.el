;;
;; Python
;;

;;
;; Modes
;;
(add-to-list 'auto-mode-alist '("/.py$'" . python-mode))

(elpy-enable)

;; Fix two keybinding overlaps:
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; Doable things:
;; - Autocomplete with "TAB"
;; - Change autocomplete with "M-x elpy-set-backend" (rope or jedi)
;; - Snippet expansion with "C-c k"
;; - Indentation highlighting with "M-x highlight-identation-mode"
;; - Simultaneous editing with "C-c o"
;; - Moving/editing code blocks with "C-c >" and "C-c <"
