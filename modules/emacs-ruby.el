;;; emacs-ruby.el --- emacs-ruby configuration
;;; Copyright (C) 2016 by KudzuValley


;; 예전 설정인데 그대로 복사한다. 나중에 다시 정리하자.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby-Mode Setting
;;
;;
(autoload 'ruby-mode "ruby-mode" "Ruby mode" t)
(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode))
           auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

 (autoload 'run-ruby "inf-ruby"
     "Run an inferior Ruby process")
 (autoload 'inf-ruby-keys "inf-ruby"
     "Set local key defs for inf-ruby in ruby-mode")
 (add-hook 'ruby-mode-hook
     '(lambda ()
         (inf-ruby-keys)))

 ;; If you have Emacs 19.2x or older, use rubydb2x
 (autoload 'rubydb "rubydb3x" "Ruby debugger" t)

 ;; uncomment the next line if you want syntax highlighting
(add-hook 'ruby-mode-hook 'turn-on-font-lock)
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'ruby-mode)
(require 'ruby-electric)
;; rails
;; (defun try-complete-abbrev (old)
;;   (if (expand-abbrev) t nil))

(defun try-complete-abbrev (old)
(if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
'(try-complete-abbrev
try-complete-file-name
try-expand-dabbrev))


(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))

(require 'rails)

;; associate ruby-mode with .rb files
(add-to-list 'auto-mode-alist '("\.rb$" . ruby-mode))

;; make #! scripts executable after saving them
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;;; mmm-mode
(add-to-list 'load-path "~/.emacs.d/mmm-mode-0.4.8")
;;(require 'mmm-mode)
(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)
(set-face-background 'mmm-output-submode-face  "LightGrey")
(set-face-background 'mmm-code-submode-face    "white")
(set-face-background 'mmm-comment-submode-face "lightgrey")
(mmm-add-classes
 '((erb-code
    :submode ruby-mode
    :match-face (("<%#" . mmm-comment-submode-face)
                 ("<%=" . mmm-output-submode-face)
                 ("<%"  . mmm-code-submode-face))
    :front "<%[#=]?"
    :back "-?%>"
    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
             (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
    )))
(add-hook 'html-mode-hook
          (lambda ()
            (setq mmm-classes '(erb-code))
            (mmm-mode-on)))
(add-to-list 'auto-mode-alist '("\.rhtml$" . html-mode))

;; shortcut to reparse the buffer
;; (global-set-key [f8] ‘mmm-parse-buffer)

;;  ((kbd "C-c g m") 'rails-nav:goto-models)
;;   ((kbd "C-c g c") 'rails-nav:goto-controllers)
;;   ((kbd "C-c g h") 'rails-nav:goto-helpers)
;;   ((kbd "C-c g l") 'rails-nav:goto-layouts)
;;   ((kbd "C-c g s") 'rails-nav:goto-stylesheets)
;;   ((kbd "C-c g j") 'rails-nav:goto-javascripts)
;;   ((kbd "C-c g g") 'rails-nav:goto-migrate)

;;   ;; Switch
;;   ((kbd "C-c <up>") 'rails-lib:run-primary-switch)
;;   ((kbd "C-c <down>") 'rails-lib:run-secondary-switch)

;;   ;; Scripts & SQL
;;   ((kbd "C-c s g c") 'rails-generate-controller)
;;   ((kbd "C-c s g m") 'rails-generate-model)
;;   ((kbd "C-c s g s") 'rails-generate-scaffold)
;;   ((kbd "C-c s g g") 'rails-generate-migration)
;;   ((kbd "C-c s d c") 'rails-destroy-controller)
;;   ((kbd "C-c s d m") 'rails-destroy-model)
;;   ((kbd "C-c s d s") 'rails-destroy-scaffold)
;;   ((kbd "C-c s c")   'rails-run-console)
;;   ((kbd "C-c s b")   'rails-run-breakpointer)
;;   ((kbd "C-c s s")   'rails-run-sql)
;;   ((kbd "C-c s r")   'rails-rake)
;;   ((kbd "C-c s w")   'rails-webrick:start)

;;   ;; Rails finds
;;   ((kbd "C-c f m") 'rails-find-models)
;;   ((kbd "C-c f c") 'rails-find-controller)
;;   ((kbd "C-c f h") 'rails-find-helpers)
;;   ((kbd "C-c f l") 'rails-find-layout)
;;   ((kbd "C-c f s") 'rails-find-stylesheets)
;;   ((kbd "C-c f j") 'rails-find-javascripts)
;;   ((kbd "C-c f g") 'rails-find-migrate)

;;   ((kbd "C-c f v") 'rails-find-view)
;;   ((kbd "C-c f d") 'rails-find-db)
;;   ((kbd "C-c f p") 'rails-find-public)
;;   ((kbd "C-c f f") 'rails-find-fixtures)
;;   ((kbd "C-c f o") 'rails-find-config)

;;   ;; Navigation
;;   ((kbd "<C-return>") 'rails-goto-file-on-current-line)
;;   ((kbd "<M-S-down>") 'rails-goto-file-from-file-with-menu)
;;   ((kbd "<M-S-up>")   'rails-goto-file-from-file)
;;   ((kbd "C-c l") 'rails-open-log)

;;   ;; Tags
;;   ((kbd "C-c C-t") 'rails-create-tags)

;;   ;; Browser
;;   ((kbd "C-c <f5>") 'rails-webrick:auto-open-browser)
;;   ;;; Doc
;;   ([f1]  'rails-search-doc)
;;   ((kbd "<C-f1>")  'rails-browse-api-at-point)
;;   ((kbd "C-c <f1>")  'rails-browse-api)

;;   ([f9]  'rails-svn-status-into-root))



(provide 'emacs-ruby)
;;; emacs-ruby.el ends here
