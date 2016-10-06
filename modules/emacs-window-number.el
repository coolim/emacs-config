;;; emacs-window-number.el --- window-number-mode configuration
;;; Copyright (C) 2016 by KudzuValley


;; Install window-numbering
(emacs-require-packages '(window-number))

(require 'window-number)

(window-number-mode t)

;;; default 키 값이 C-x C-j number 이다.
(window-number-define-keys window-number-mode-map "C-x j ")

;;; M-number 로 하려면 아래 설정을 한다.
(window-number-meta-mode t)

(provide 'emacs-window-number)

;;; emacs-window-number.el ends here
