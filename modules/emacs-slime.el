;;; emacs-slime.el --- emacs-slime configuration
;;; Copyright (C) 2016 by KudzuValley


;;;; 예전 설정인데 나중에 다시 설정해야 한다. 현재 common lisp을 하기 위해서 slime 을
;;;; 사용하는지도 모르겠다. 다시 한번 체크해야 한다.

;;;;;;; setting slime  for clisp ;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/slime-2.0")
(require 'slime)
;; UTF-8 인코딩을 기본으로 사용 --> 한글 symbol 사용을 위해
(setq slime-net-coding-system 'utf-8-unix)
;; Lisp 실행 파일
(setq inferior-lisp-program "/opt/local/bin/clisp")
(setq common-lisp-hyperspec-root
      "http://www.lispworks.com/documentation/HyperSpec/")
;; FireFox를 사용한다면 아래 주석 해제
;(setq browse-url-generic-program
;      "C:/Program Files/Mozilla Firefox/firefox.exe")
;(setq browse-url-browser-function (quote browse-url-generic))
(add-hook 'inferior-lisp-mode-hook
    (lambda () (inferior-slime-mode t)))
(add-hook 'lisp-mode-hook
    (lambda ()
            (set (make-local-variable
                  'lisp-indent-function)
                 'common-lisp-indent-function)))
;; slime-setup
(slime-setup :autodoc t)


;;;;;;; setting slime  for sbcl ;;;;;;;;;;

;;(add-to-list 'load-path "~/.emacs.d/slime-2.0")
;;(add-to-list 'load-path "~/Library/Emacs/site-lisp/slime")
;;(add-to-list 'load-path "~/Library/Emacs/site-lisp/slime/contrib")

;; (require 'slime)

;; (slime-setup
;;  '(inferior-slime
;;    slime-asdf
;;    slime-autodoc
;;    slime-banner
;;    slime-c-p-c
;;    slime-editing-commands
;;    slime-fancy-inspector
;;    slime-fancy
;;    slime-fuzzy
;;    slime-highlight-edits
;;    slime-parse
;;    slime-presentation-streams
;;    slime-presentations
;;    slime-references
;;    slime-scratch
;;    slime-tramp
;;    slime-typeout-frame
;;    slime-xref-browser))       ; fixed per suggestion from tcr on #lisp

;; ;;(setq slime-net-coding-system 'utf-8-unix)

;; (setq slime-lisp-implementations
;;       '((sbcl ("sbcl" "--core"
;;                "/home/johnw/Library/Lisp/sbcl.core-with-slime")
;;               :init (lambda (port-file _)
;;                       (format
;;                        "(swank:start-server %S :coding-system \"utf-8-unix\")\n"
;;                        port-file))
;;               :coding-system utf-8-unix)
;;         (cmucl ("lisp"))
;;         (ecl ("ecl"))
;;         (allegro ("/usr/local/stow/AllegroCL/alisp"))
;;         (clisp ("clisp") :coding-system utf-8-unix)
;;         (lispworks (""))
;;         (openmcl ("dx86cl64"))))

;; (setq slime-default-lisp 'sbcl)

;; (defun start-slime ()
;;   (interactive)
;;   (unless (slime-connected-p)
;;     (save-excursion (slime))))
;; (add-hook 'slime-mode-hook 'start-slime)

;; (add-hook 'slime-load-hook
;;           #'(lambda () (require 'slime-fancy)))
;; (add-hook 'inferior-lisp-mode-hook
;;           #'(lambda () (inferior-slime-mode t)))

;; (setq special-display-regexps
;;       (quote (("slime-repl" (height . 40) (width . 80)
;;                (top . 85) (left . 50))
;;               ("sldb" (height . 30) (width . 50)
;;                (left . 10) (top . 25)))))

;; (eval-after-load "hyperspec"
;;   '(progn
;;      (setq common-lisp-hyperspec-root
;;            "~/Reference/Computing/Languages/Common Lisp/HyperSpec/")))

;; (defun indent-or-complete (&optional arg)
;;   (interactive "p")
;;   (if (or (looking-back "^\\s-*") (bolp))
;;       (call-interactively 'lisp-indent-line)
;;     (call-interactively 'slime-indent-and-complete-symbol)))

;; (eval-after-load "lisp-mode"
;;   '(progn
;;      (define-key lisp-mode-map [tab] 'indent-or-complete)
;;      (define-key lisp-mode-map [(meta ?q)] 'slime-reindent-defun)))

;; (eval-after-load "slime"
;;   '(progn
;;      (define-key slime-mode-map [return] 'paredit-newline)
;;      (define-key slime-repl-mode-map [tab] 'indent-or-complete)
;;      (define-key inferior-slime-mode-map [(control ?c) (control ?p)]
;;        'slime-repl-previous-prompt)))

;; setting cldoc

;; (autoload 'turn-on-cldoc-mode "cldoc" nil t)

;; (dolist (hook '(lisp-mode-hook

;;                 slime-repl-mode-hook))

;;   (add-hook hook 'turn-on-cldoc-mode))





(provide 'emacs-slime)
;;; emacs-slime.el ends here
