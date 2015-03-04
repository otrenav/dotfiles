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

;; TODO: Fix according to screen
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
;; TODO: Fix this. Use screen size.
(if (string-equal system-name "OLAP")
    (set-face-attribute 'default nil
                        :font "Source Code Pro-16"))

(if (string-equal system-name "OMAC")
    (set-face-attribute 'default nil
                        :font "Source Code Pro-18"))
;;
;; Themes
;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (if window-system
;;     (load-theme 'solarized-light t)
;;   (load-theme 'wombat t))

;;
;; Ido
;;
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;;
;; Smex
;;
;; TODO: Figure this out.
(require 'smex)
(smex-initialize)
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))


;;
;; Experimental
;;

;;default display position/size based on display resolution
;;warning: assumption that the 24/22 " displays are oriented
;;         above the laptop's display
;;         Haven't found a way to check multiple monitor
;;         relative orientation via emacs yet...
;;
;; a frame is passed in when firing on after-make-frame-fuctions,
;; but not necessary when calling interactively
;; (defun reset-ui (&optional frame)
;;   (if frame
;;     (select-frame frame))
;;   (interactive)
;;   (smex-initialize)
;;   (load-theme 'solarized-dark t)
;;   (delete-other-windows)
;;   (set-cursor-color "deeppink")
;;   (set-face-background 'modeline-inactive "gray10")
;;   (if (window-system)
;;       (cond
;;        ((= 1050 (display-pixel-height)); 22" display
;;         (set-frame-size (selected-frame) 163 71)
;;         (set-frame-position (selected-frame) 0 -1050))
;;        ((= 1200 (display-pixel-height)); 24" display
;;         (set-frame-size (selected-frame) 163 76)
;;         (set-frame-position (selected-frame) 0 -1200))
;;        (t ; laptop runs 1440x900
;;         (set-frame-size (selected-frame) 163 53)
;;         (set-frame-position (selected-frame) 0 0))))
;;   (split-window-horizontally))

;; ;; fires when an emacs frame is created (emacsclient)
;; ;; invoke like this ( on osx):
;; ;; emacsclient -c -n; osascript -e "tell application \"Emacs\" to activate"
;; (add-hook 'after-make-frame-functions 'reset-ui)

;; ;; hook for setting up UI when not running in daemon mode
;; (add-hook 'emacs-startup-hook 'reset-ui)

;; (fset 'eshell-visor-on
;;       "\C-x1\M-xeshell\n")
;; (fset 'eshell-visor-off
;;       "\C-x3\M-xbury-buffer\n\C-xo\M-xbury-buffer\n\M-xswap-windows")

;; ;; assumes using reset-ui based layout
;; (defun toggle-eshell-visor ()
;;   (interactive)
;;   (if (string= "eshell-mode" (eval 'major-mode))
;;       (execute-kbd-macro (symbol-function 'eshell-visor-off))
;;     (execute-kbd-macro (symbol-function 'eshell-visor-on))))
