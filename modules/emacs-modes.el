;;; emacs-modes.el --- emacs-modes configuration
;;; Copyright (C) 2016 by KudzuValley


;; emacs 에서 각종 file format mode 에 대해서 정의한다.
;; file format 관련 mode 는 단순 highlight 기능만을 사용하기 때문에 따로 lisp 파일을
;; 작성하지 말고 emacs-modes.el 파일에 정의한다.

(emacs-require-packages '(actionscript-mode dts-mode markdown-mode groovy-mode batch-mode))

;; ==================================
;; actionscript-mode
;; ==================================
(require 'actionscript-mode)

;; ==================================
;; dts-mode
;; ==================================
(require 'dts-mode)


;; =======================================
;; markdown-mode
;; =======================================
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; =======================================
;; groovy-mode
;; =======================================
(require 'groovy-mode)
;; for gradle or groovy
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
;;(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
;; For some reason, these recommendations don't seem to work with Aquamacs
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
;; This does work with Aquamacs
(add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
(add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; This _might_ not work with Aquamacs (not sure what value it offers)
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))
;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))


;; =======================================
;; batch-mode
;; =======================================
;; bat file for windows
(require 'batch-mode)
;;(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))

(provide 'emacs-modes)
;;; emacs-modes.el ends here



