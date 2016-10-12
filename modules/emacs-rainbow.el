;;; emacs-rainbow.el --- emacs-rainbow configuration
;;; Copyright (C) 2016 by KudzuValley

;;; 가로를 depth 별로 색으로 구분을 하는 pacakge 이다.

(emacs-require-packages '(rainbow-delimiters rainbow-blocks))

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

(when (require 'rainbow-delimiters nil 'noerror)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;; rainbow-blocks 는 rainbow-delimiters 의 fork 버전이다.
;; delimiters 처럼 단순히 가로만 색이 변하는 것이 아니라 전체 가로 블럭이 같이 변한다.
;; 이것을 원하면 이것으로 한다.
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


(provide 'emacs-rainbow)
;;; emacs-rainbow.el ends here
