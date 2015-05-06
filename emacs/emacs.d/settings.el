;;
;; General settings
;;

(defalias 'yes-or-no-p 'y-or-n-p)
(require 'autopair)
(require 'dired+)

(autopair-global-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(global-visual-line-mode nil)
(menu-bar-mode -1)
(pending-delete-mode t)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq echo-keystrokes 0.1)
(setq indent-tabs-mode nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(setq tab-width 4)
(setq use-dialog-box nil)
(setq visible-bell t)
(setq x-select-enable-clipboard t)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default truncate-lines t)
(show-paren-mode t)
(toggle-diredp-find-file-reuse-dir 1)
(tool-bar-mode -1)
(transient-mark-mode t)

;; Theme
(require 'moe-theme)
(load-theme 'moe-dark t)
(require 'powerline)
(powerline-default-theme)
(powerline-moe-theme)
(require 'moe-theme-switcher)
(moe-theme-set-color 'w/b)

;; Info about empty lines
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Mouse scrolling
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; (setq scroll-conservatively 1000)
(scroll-bar-mode -1)

(if (display-graphic-p)
    (scroll-bar-mode -1)
  (progn
    (require 'mouse)
    (xterm-mouse-mode 1)
    (global-set-key [mouse-4] '(lambda ()
                                 (interactive)
                                 (scroll-down 1)))
    (global-set-key [mouse-5] '(lambda ()
                                 (interactive)
                                 (scroll-up 1)))
    (defun track-mouse(e))
    (setq mouse-sel-mode 1)))

(set-face-attribute 'default nil
                    :font "Source Code Pro-13")

;; Ido
(require 'ido)
(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

;; Smex
(require 'smex)
(smex-initialize)
(setq smex-save-file
      (expand-file-name "misc/smex-items" user-emacs-directory))

;; Backups
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/backup/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))
(setq auto-save-list-file-prefix autosave-dir)

;; Acejump mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Dired
(require 'dired-x)
(setq-default dired-omit-files-p t)
