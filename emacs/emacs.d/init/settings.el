;;
;; General settings
;;
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'autopair)
(require 'ido)

(autopair-global-mode t)
(delete-selection-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(global-visual-line-mode t)
(ido-mode t)
(load-theme 'flatui t)
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
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq tab-width 4)
(setq use-dialog-box nil)
(setq visible-bell t)
(setq x-select-enable-clipboard t)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(show-paren-mode t)
(tool-bar-mode -1)
(transient-mark-mode t)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(set-face-attribute 'default nil
                    :font "Source Code Pro-18"
                    :weight 'normal)

;;
;; Graphic vs terminal
;;
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

(when window-system (set-frame-size (selected-frame) 85 47))

;;
;; Mouse scrolling
;;
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-conservatively 1000)
;; (setq scroll-step 1)
(scroll-bar-mode -1)

;;
;; I use different screens in my setup
;;
(if (string-equal system-name "OLAP")
    (set-face-attribute 'default nil
                        :height 150))

(if (string-equal system-name "OMAC")
    (set-face-attribute 'default nil
                        :height 190))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

