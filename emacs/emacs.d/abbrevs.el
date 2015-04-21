;;
;; Abreviations
;;

(define-abbrev-table 'global-abbrev-table '(

    ;; Mathematics / Unicode
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")

    ;; Emails
    ("8pomar" "otrenav@gmail.com")
    ("8psanti" "santiago9101@gmail.com")
    ("8pmau" "mct.camps@gmail.com")
    ("8pjos" "jmps2812@gmail.com")
    ("8domar" "omar.trejo@datata.mx")
    ("8dsanti" "santiago.aragon@datata.mx")
    ("8djos" "jose.proudinat@datata.mx")
    ("8dmau" "mauricio.camps@datata.mx")

    ;; Computing / Companies
    ("8wp" "Wikipedia")
    ("8ms" "Microsoft")
    ("8g" "Google")
    ("8it" "IntelliType")
    ("8msw" "Microsoft Windows")
    ("8win" "Windows")
    ("8ie" "Internet Explorer")
    ("8ahk" "AutoHotkey")

    ;; English words
    ("8alt" "alternative")
    ("8char" "character")
    ("8def" "definition")
    ("8bg" "background")
    ("8kb" "keyboard")
    ("8ex" "example")
    ("8kbd" "keybinding")
    ("8env" "environment")
    ("8var" "variable")
    ("8ev" "environment variable")
    ("8cp" "computer")

    ;; Signature
    ("8ot" "Omar Trejo")

    ;; URLs
    ("8wot" "http://otrenav.wordpress.com")

    ;; Emacs Regex
    ("8d" "\\([0-9]+?\\)")
    ("8str" "\\([^\"]+?\\)\"")

    ;; Shell commands
    ("8ditto" "ditto -ck --sequesterRsrc --keepParent src dest")
    ("8im" "convert -quality 85% ")

    ("8f0" "find . -type f -size 0 -exec rm {} ';'")
    ("8rsync" "rsync -z -r -v -t --exclude=\"*~\" --exclude=\".DS_Store\" --exclude=\".bash_history\" --exclude=\"**/xx_xahlee_info/*\"  --exclude=\"*/_curves_robert_yates/*.png\" --exclude=\"logs/*\"  --exclude=\"xlogs/*\" --delete --rsh=\"ssh -l xah\" ~/web/ xah@example.com:~/")
    ))

;; Always save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; Turn on abbrev mode globally
(setq-default abbrev-mode t)

;;
;; TODO: Org-mode?
;;
;; (add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

;; (define-skeleton skel-org-block-elisp
;;   "Insert an emacs-lisp block"
;;   ""
;;   "#+begin_src emacs-lisp\n"
;;   _ - \n
;;   "#+end_src\n")

;; (define-abbrev org-mode-abbrev-table "elsrc" "" 'skel-org-block-elisp)

;; (define-skeleton skel-org-block-js
;;   "Insert a JavaScript block"
;;   ""
;;   "#+begin_src js\n"
;;   _ - \n
;;   "#+end_src\n")

;; (define-abbrev org-mode-abbrev-table "jssrc" "" 'skel-org-block-js)

;; (define-skeleton skel-header-block
;;   "Creates my default header"
;;   ""
;;   "#+TITLE: " str "\n"
;;   "#+AUTHOR: Aaron Bedra\n"
;;   "#+EMAIL: aaron@aaronbedra.com\n"
;;   "#+OPTIONS: toc:3 num:nil\n"
;;   "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />\n")

;; (define-abbrev org-mode-abbrev-table "sheader" "" 'skel-header-block)

;; (define-skeleton skel-org-html-file-name
;;   "Insert an HTML snippet to reference the file by name"
;;   ""
;;   "#+HTML: <strong><i>"str"</i></strong>")

;; (define-abbrev org-mode-abbrev-table "fname" "" 'skel-org-html-file-name)


;;
;; NGX
;;
;; (define-skeleton skel-ngx-config
;;   "Template for NGINX module config file"
;;   ""
;;   "ngx_addon_name=ngx_http_" str  "_module\n"
;;   "HTTP_MODULES=\"$HTTP_MODULES ngx_http_" str "_module\"\n"
;;   "NGX_ADDON_SRCS=\"$NGX_ADDON_SRCS $ngx_addon_dir/ngx_http_" str "_module.c\"")

;; (define-abbrev fundamental-mode-abbrev-table "ngxcnf" "" 'skel-ngx-config)

;; (define-skeleton skel-ngx-module
;;   "Template for NGINX modules"
;;   ""
;;   "#include <nginx.h>\n"
;;   "#include <ngx_config.h>\n"
;;   "#include <ngx_core.h>\n"
;;   "#include <ngx_http.h>\n\n"

;;   "ngx_module_t ngx_http_" str "_module;\n\n"

;;   "static ngx_int_t\n"
;;   "ngx_http_" str "_handler(ngx_http_request_t *r)\n"
;;   "{\n"
;;   >"if (r->main->internal) {\n"
;;   >"return NGX_DECLINED;\n"
;;   "}" > \n
;;   \n
;;   >"ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, \"My new module\");\n\n"
;;   > _ \n
;;   >"return NGX_OK;\n"
;;   "}" > "\n\n"

;;   "static ngx_int_t\n"
;;   "ngx_http_"str"_init(ngx_conf_t *cf)\n"
;;   "{\n"
;;   >"ngx_http_handler_pt *h;\n"
;;   >"ngx_http_core_main_conf_t *cmcf;\n\n"

;;   >"cmcf = ngx_http_conf_get_module_main_conf(cf, ngx_http_core_module);\n"
;;   >"h = ngx_array_push(&cmcf->phases[NGX_HTTP_ACCESS_PHASE].handlers);\n\n"

;;   >"if (h == NULL) {\n"
;;   >"return NGX_ERROR;\n"
;;   "}" > \n
;;   \n
;;   >"*h = ngx_http_"str"_handler;\n\n"

;;   >"return NGX_OK;\n"
;;   "}" > \n
;;   \n
;;   "static ngx_http_module_t ngx_http_"str"_module_ctx = {\n"
;;   >"NULL,                 /* preconfiguration */\n"
;;   >"ngx_http_"str"_init,  /* postconfiguration */\n"
;;   >"NULL,                 /* create main configuration */\n"
;;   >"NULL,                 /* init main configuration */\n"
;;   >"NULL,                 /* create server configuration */\n"
;;   >"NULL,                 /* merge server configuration */\n"
;;   >"NULL,                 /* create location configuration */\n"
;;   >"NULL                  /* merge location configuration */\n"
;;   "};" > \n
;;   \n

;;   "ngx_module_t ngx_http_"str"_module = {\n"
;;   >"NGX_MODULE_V1,\n"
;;   >"&ngx_http_"str"_module_ctx,  /* module context */\n"
;;   >"NULL,                        /* module directives */\n"
;;   >"NGX_HTTP_MODULE,             /* module type */\n"
;;   >"NULL,                        /* init master */\n"
;;   >"NULL,                        /* init module */\n"
;;   >"NULL,                        /* init process */\n"
;;   >"NULL,                        /* init thread */\n"
;;   >"NULL,                        /* exit thread */\n"
;;   >"NULL,                        /* exit process */\n"
;;   >"NULL,                        /* exit master */\n"
;;   >"NGX_MODULE_V1_PADDING\n"
;;   "};" >)

;; (require 'cc-mode)
;; (define-abbrev c-mode-abbrev-table "ngxmod" "" 'skel-ngx-module)

;; (define-skeleton skel-ngx-append-header
;;   "Template for header appending function for NGINX modules"
;;   ""
;;   "static void append_header(ngx_http_request_t *r)\n"
;;   "{\n"
;;   > "ngx_table_elt_t *h;\n"
;;   > "h = ngx_list_push(&r->headers_out.headers);\n"
;;   > "h->hash = 1;\n"
;;   > "ngx_str_set(&h->key, \"X-NGINX-Hello\");\n"
;;   > "ngx_str_set(&h->value, \"Hello NGINX!\");\n"
;;   "}\n")

;; (define-abbrev c-mode-abbrev-table "ngxhdr" "" 'skel-ngx-append-header)
