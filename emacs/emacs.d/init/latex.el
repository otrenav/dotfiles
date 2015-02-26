;;
;; Latex
;;
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
