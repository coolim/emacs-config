;;; emacs-candidate.el --- emacs-candidate configuration
;;; Copyright (C) 2016 by KudzuValley

;; 기능 검증을 한다.



; highligt enable
(global-font-lock-mode t)


; maximum colors
(setq font-lock-maximum-decoration t)

; highlight during query
(setq query-replace-highlight t)

; highlight incremental search
(setq search-highlight t)               
 
(setq font-lock-maximum-size nil)

;; dynamic-completion-mode 가 정의 되어 있다면(fboundp) 설정한다.
(if (fboundp 'dynamic-completion-mode) (dynamic-completion-mode t))


(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(setq track-eol nil)
(setq scroll-step 1)
(setq hscroll-step 1)

(global-set-key "\C-m" 'newline-and-indent)

;; auto fill 이라는 것은 문장을 계속 쓰다가 Space 가 들어가면 자동으로 여러라인으로 나누어 진다.
;; M-q 와 비슷하다고 봐도 무방하다. 이 모드는 별로 선호하는 기능은 아니다.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq find-file-visit-truename nil)
;;(buffer-file-name)
;;(file-truename (buffer-file-name))



;; 이미 기본적으로 transient 가 되어 있지만 확실하게 하자.
(if (fboundp 'transient-mark-mode) (transient-mark-mode t))


;;;; 가로를 depth 별로 색으로 구분을 한다.
;;(require 'rainbow-delimiters)

;; (dolist (x '(scheme emacs-lisp lisp clojure))
;;   (add-hook
;;    (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))


;; (when (require 'rainbow-delimiters nil 'noerror) 
;;   (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))
;; 24.1 부터 나온 개념으로서 모든 프로그램 모드의 상위 부모이다.
;; The Parent of All Programming Modes
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) 


;;; 가로를 depth 별로 색으로 구분을 한다.
(when (require 'rainbow-delimiters nil 'noerror)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))



;; rainbow-blocks 는 rainbow-delimiters 의 fork 버전이다.
;; delimiters 처럼 단순히 가로만 색이 변하는 것이 아니라 전체 가로 블럭이 같이 변한다.
;; (require 'rainbow-blocks)


;; (dolist (x '(scheme emacs-lisp lisp clojure))
;;   (add-hook
;;    (intern (concat (symbol-name x) "-mode-hook")) 'turn-on-paredit)
;;   (add-hook
;;    (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-paren-mode))

;; (dolist (x '(scheme emacs-lisp lisp clojure))
;;   (add-hook
;;    (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-paren-mode))


;; (dolist (x '(scheme emacs-lisp lisp clojure))
;;   (add-hook
;;    (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-blocks-mode))

;; (add-hook 'clojure-mode-hook 'rainbow-blocks-mode)


;; ;; smart pairing for all
;; (require 'smartparens-config)
;; (setq sp-base-key-bindings 'paredit)
;; (setq sp-autoskip-closing-pair 'always)
;; (setq sp-hybrid-kill-entire-symbol nil)
;; (sp-use-paredit-bindings)

;; (show-smartparens-global-mode +1)




(provide 'emacs-candidate)
;;; emacs-candidate.el ends here
