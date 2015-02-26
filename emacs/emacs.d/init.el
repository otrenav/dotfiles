;;
;; Emacs configuratioon file
;; June, 2014
;; Omar Trejo Navarro
;;

(load "~/.emacs.d/init/path.el")
(load "~/.emacs.d/init/packages.el")
(load "~/.emacs.d/init/functions.el")
(load "~/.emacs.d/init/settings.el")
(load "~/.emacs.d/init/editing.el")
(load "~/.emacs.d/init/latex.el")
(load "~/.emacs.d/init/pdf.el")
(load "~/.emacs.d/init/helm.el")
(load "~/.emacs.d/init/spellcheck.el")
(load "~/.emacs.d/init/python.el")
(load "~/.emacs.d/init/matlab.el")
(load "~/.emacs.d/init/ess.el")
(load "~/.emacs.d/init/lisp.el")
(load "~/.emacs.d/init/keybindings.el")

(custom-set-variables
 '(doc-view-ghostscript-program "/usr/local/bin/gs")
 '(matlab-comment-anti-indent 0)
 '(matlab-fill-code t)
 '(matlab-functions-have-end t)
 '(matlab-indent-function-body t)
 '(matlab-shell-command-switches (quote ("-nodesktop -nosplash"))))
