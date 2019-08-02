;;
;; This file should be located in a Python's project root directory.
;; It will tell Emacs what Python Environment to use, so it will
;; activate Python 3 syntax checking, and other useful features.
;; It requires that you have the pyenv-mode configured, and the
;; following in your configuration files:
;; (setenv "WORKON_HOME" "~/code/system/python/envs/")
;;
((nil . ((pyvenv-workon . "<virtualenvwrapper-env-name>"))))
