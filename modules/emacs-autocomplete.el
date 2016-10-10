;;; emacs-autocomplete.el --- emacs-autocomplete configuration
;;; Copyright (C) 2016 by KudzuValley

;; ==================================
;; auto-complete
;; ==================================
(require 'auto-complete-config)
;; default directory : .emacs.d/elpa/auto-complete-1.5.1/dict
;;(add-to-list 'ac-dictionary-directories "/home/yhlim/.emacs.d/ac-dict")
(ac-config-default)
(ac-flyspell-workaround)

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))


;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(define-key ac-completing-map (kbd "C-M-n") 'ac-next)
(define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)





;; (require 'auto-complete-clang)
;; ;;(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
;; (define-key c++-mode-map (kbd "C-M-<return>") 'ac-complete-clang)
;; (global-set-key (kbd "C-`") 'ac-complete-clang)
;; ;; replace C-S-<return> with a key binding that you want




(provide 'emacs-autocomplete)
;;; emacs-autocomplete.el ends here
