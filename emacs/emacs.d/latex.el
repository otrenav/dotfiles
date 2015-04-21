;;
;; Latex
;;

;;
;; Modes
;;
(add-to-list 'auto-mode-alist '("/.tex$'" . latex-mode))

(require 'latex-pretty-symbols)
(require 'auctex-latexmk)
(add-hook 'latex-mode-hook 'imenu-add-menubar-index)
(add-hook 'latex-mode-hook 'latex-math-mode)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'visual-line-mode)
;; (auctex-latexmk-setup)
(setq reftex-plug-into-AUCTeX t)
(setq tex-auto-save t)
(setq tex-electric-sub-and-superscript t)
(setq tex-parse-self t)
(setq tex-pdf-mode t)
(setq tex-save-query nil)
(setq-default tex-master nil)

;;
;; PDF
;;

;;
;; Sync with Skim
;;
;; http://www.stefanom.org/setting-up-a-nice-auctex-environment-on-mac-os-x/
(add-hook 'tex-mode-hook '(lambda () (setq tex-command-default "latexmk")))
(add-hook 'latex-mode-hook
          (lambda ()
            (push
             '("latexmk" "latexmk -pdf %s" tex-run-tex nil t
               :help "Run latexmk on file.")
             tex-command-list)))
(setq tex-view-program-selection '((output-pdf "PDF Viewer")))
(setq tex-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; TODO: Figure out how to integrate this with latex
