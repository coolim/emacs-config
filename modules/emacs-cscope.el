;;; emacs-cscope.el --- emacs-cscope configuration
;;; Copyright (C) 2016 by KudzuValley

;; ==================================
;; cscope 
;; ==================================
(require 'xcscope)
(cscope-setup)

(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map "\C-css" 'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map "\C-csg" 'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map "\C-csu" 'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)
(define-key global-map "\C-cse" 'cscope-find-egrep-pattern)
(global-set-key (kbd "C-6") 'cscope-history-forward-line-current-result)
(global-set-key (kbd "C-8") 'cscope-history-backward-line-current-result)
(define-key global-map "\C-csf" 'cscope-find-files-including-file)

;; C-c s			Prefix Command

;; C-c s =			cscope-find-assignments-to-this-symbol
;; C-c s A			cscope-unset-initial-directory
;; C-c s B			cscope-display-buffer-toggle
;; C-c s C			cscope-find-called-functions
;; C-c s D			cscope-dired-directory
;; C-c s E			cscope-edit-list-of-files-to-index
;; C-c s G			cscope-find-global-definition-no-prompting
;; C-c s I			cscope-index-files
;; C-c s L			cscope-create-list-of-files-to-index
;; C-c s N			cscope-history-forward-file-current-result
;; C-c s P			cscope-history-backward-file-current-result
;; C-c s S .. C-c s T				cscope-tell-user-about-directory
;; C-c s W			cscope-tell-user-about-directory
;; C-c s a			cscope-set-initial-directory
;; C-c s b			cscope-display-buffer
;; C-c s c			cscope-find-functions-calling-this-function
;; C-c s d			cscope-find-global-definition
;; C-c s e			cscope-find-egrep-pattern
;; C-c s f			cscope-find-this-file
;; C-c s g			cscope-find-global-definition
;; C-c s i			cscope-find-files-including-file
;; C-c s n			cscope-history-forward-line-current-result
;; C-c s p			cscope-history-backward-line-current-result
;; C-c s s			cscope-find-this-symbol
;; C-c s t			cscope-find-this-text-string
;; C-c s u			cscope-pop-mark

(add-hook 'java-mode-hook (function cscope:hook))
(add-hook 'java/lh-mode-hook (function cscope:hook))
(add-hook 'makefile-gmake-mode-hook (function cscope:hook))
(add-hook 'makefile-mode-hook (function cscope:hook))
(add-hook 'nXML-mode-hook (function cscope:hook))
(add-hook 'nxml-mode-hook (function cscope:hook))
(add-hook 'XML-mode-hook (function cscope:hook))
(add-hook 'xml-mode-hook (function cscope:hook))
(add-hook 'cc-mode-hook (function cscope:hook))

(cscope-minor-mode t)



(provide 'emacs-cscope)
;;; emacs-cscope.el ends here
