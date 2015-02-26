;;
;; Sync with Skim
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
