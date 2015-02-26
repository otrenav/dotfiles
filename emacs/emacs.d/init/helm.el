;;
;; Helm
;;

;; Instant recursive grep on a directory with helm
(defun instant-rgrep-using-helm ()
  "Recursive grep in a directory."
  (interactive)
  (let ((helm-after-initialize-hook #'helm-follow-mode))
    (helm-do-grep)))

;; Instant search across all buffers with helm
(defun instant-search-using-helm ()
  "Multi-occur in all buffers backed by files."
  (interactive)
  (let ((helm-after-initialize-hook #'helm-follow-mode))
    (helm-multi-occur
     (delq nil
           (mapcar (lambda (b)
                     (when (buffer-file-name b) (buffer-name b)))
                   (buffer-list))))))
