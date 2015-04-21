;;
;; Org-mode
;;

;; TODO: Set this up

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))

(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

;;
;; First, create the global binding for org-agenda. This allows it to be quickly accessed. The agenda view requires that org files be added to it. The personal.org and groupon.org files are my daily files for review. I have a habit to plan the next day. I do this by assessing my calendar and my list of todo items. If a todo item is already scheduled or has a deadline, don't show it in the global todo list.
;;
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)

(setq org-agenda-files (list "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/groupon.org"))

;;
;; I have several habits that I also track. In order to take full advantage of this feature org-habit has to be required and added to org-modules. A few settings are also tweaked for habit mode to make the tracking a little more palatable. The most significant of these is org-habit-graph-column. This specifies where the graph should start. The default is too low and cuts off a lot, so I start it at 80 characters.
;;

(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")

(setq org-habit-preceding-days 7
      org-habit-following-days 1
      org-habit-graph-column 80
      org-habit-show-habits-only-for-today t
      org-habit-show-all-today t)
