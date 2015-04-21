;;
;; Path
;;
(getenv "PATH")

(setenv "PATH"
        (concat
         "/usr/texbin" ":"
         (getenv "PATH")))

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
