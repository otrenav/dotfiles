;;
;; General settings
;;
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'autopair)
(require 'ido)

(autopair-global-mode t)
(ido-mode t)
(pending-delete-mode t)
(show-paren-mode t)
(tool-bar-mode -1)
(setq make-backup-files nil)

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

(global-font-lock-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(global-visual-line-mode t)
(load-theme 'solarized-light t)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(menu-bar-mode -1)

;;
;; Fonts
;;
(set-face-attribute 'default nil
                    :family "Droid Sans Mono"
                    :weight 'normal)

;;
;; Scrolling
;;
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-conservatively 10000)
(setq scroll-step 1)
(scroll-bar-mode -1)

;;
;; Different computers
;;
(if (string-equal system-name "OLAP")
    (set-face-attribute 'default nil
                        :height 150))
(if (string-equal system-name "OMAC")
    (set-face-attribute 'default nil
                        :height 180))

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(setq tab-width 4
      indent-tabs-mode nil)


;; I have some modifications to the default display.
;; First, a minor tweak to the frame title. It's also nice to be able to
;; see when a file actually ends. This will put empty line markers into
;; the left hand side.

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (set-face-attribute 'default nil
                      :family "Inconsolata"
                      :height 140
                      :weight 'normal
                      :width 'normal)

  (when (functionp 'set-fontset-font)
    (set-fontset-font "fontset-default"
                      'unicode
                      (font-spec :family "DejaVu Sans Mono"
                                 :width 'normal
                                 :size 12.4
                                 :weight 'normal))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))


;;
;;
;;
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)
