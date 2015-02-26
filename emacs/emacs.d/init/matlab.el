;;
;; MATLAB
;;
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(custom-set-variables
 '(matlab-comment-anti-indent 0)
 '(matlab-fill-code t)
 '(matlab-functions-have-end t)
 '(matlab-indent-function-body t)
 '(matlab-shell-command-switches (quote ("-nodesktop -nosplash"))))

;; Matlab debugging
(global-set-key (kbd "<f10>") 'gud-cont)
(global-set-key (kbd "<f9>") 'gud-step)  ;; Step in
(global-set-key (kbd "<f8>") 'gud-next)  ;; Step 1 
(global-set-key (kbd "<f7>") 'gud-finish)  ;; Step back
