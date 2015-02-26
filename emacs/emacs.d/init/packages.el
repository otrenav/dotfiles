;;
;; Packages
;;
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(defvar packages '(ace-jump-mode
                   anchored-transpose
                   angular-snippets
                   async
                   auctex
                   auctex-latexmk
                   auto-complete
                   auto-yasnippet
                   autopair
                   company
                   ctable
                   diff-hl
;;                   dired-x
                   django-snippets
                   editorconfig
                   el-autoyas
;;                   eldoc-mode
                   elpy
                   ess
                   ess-R-data-view
                   ess-R-object-popup
                   ess-smart-underscore
                   expand-region
                   find-file-in-project
                   flyspell-lazy
                   flx
                   git-commit-mode
                   git-rebase-mode
                   god-mode
                   helm
                   helm-R
                   highlight-indentation
n                   ibuffer
                   ido-vertical-mode
                   ido-ubiquitous
                   jedi
                   latex-pretty-symbols
                   magit
                   magit-filenotify
		   markdown-mode
                   matlab-mode
		   nodejs-repl
                   org
                   pony-mode
                   popup
                   powerline
                   pymacs
                   pyvenv
                   projectile
                   r-autoyas
                   recentf
                   rainbow-mode
                   react-snippets
                   s
                   smex
                   solarized-theme
;;                   transient-mark-mode
                   tomatinho
;;                   uniquify
                   yasnippet
                   web-mode
                   windmove
                   winner-mode))

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))
