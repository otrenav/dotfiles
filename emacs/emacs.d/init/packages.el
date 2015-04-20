;;
;; Automadted packages
;;
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(defvar packages '(ac-helm
                   ac-html
                   ac-html-bootstrap
                   ac-html-csswatcher
                   ac-js2
                   ac-math
                   ace-jump-mode
                   ace-window
                   aes
                   anaconda-mode
                   anchored-transpose
                   angular-snippets
                   async
                   auctex
                   auctex-latexmk
                   auto-compile
                   auto-complete
                   auto-complete-auctex
                   auto-complete-chunk
                   auto-yasnippet
                   autopair
                   bog
                   bookmark+
                   capture
                   cdlatex
                   diff-hl
                   dired+
                   dired-details+
                   dired-imenu
                   dired-rainbow
                   dired-subtree
                   direx
                   django-mode
                   django-snippets
                   djvu
                   editorconfig
                   ein
                   el-autoyas
                   elpy
		   epc
                   ess
                   ess-R-data-view
                   ess-R-object-popup
                   ess-smart-equals
                   ess-smart-underscore
                   expand-region
                   flatui-theme
                   flymake-python-pyflakes
                   flyspell-lazy
                   frame-fns
                   helm
                   helm-R
                   helm-ack
                   helm-bibtex
                   helm-bind-key
                   helm-chrome
                   helm-css-scss
                   helm-dictionary
                   helm-dired-recent-dirs
                   helm-dirset
                   helm-emmet
                   helm-flymake
                   helm-flyspell
                   helm-git
                   helm-helm-commands
                   helm-itunes
                   helm-mt
                   helm-open-github
                   ibuffer
                   ido-vertical-mode
                   jedi
                   jedi-direx
                   latex-pretty-symbols
                   magit
                   magit-filenotify
                   markdown-mode
                   math-symbol-lists
                   matlab-mode
                   multi-term
                   nodejs-repl
                   nose
                   org
                   pony-mode
                   popup
                   powerline
                   projectile
                   pungi
                   py-autopep8
                   py-import-check
                   py-isort
                   pydoc-info
                   pyenv-mode
                   pyimpsort
                   pylint
                   python-django
                   python-environment
                   python-info
                   python-mode
                   pyvenv
                   r-autoyas
                   rainbow-mode
                   react-snippets
                   recentf
                   skewer-mode
                   smex
                   solarized-theme
		   ido-vertical-mode
                   virtualenvwrapper
                   web-beautify
                   web-mode
                   windmove
                   window-jump
                   yasnippet))

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

