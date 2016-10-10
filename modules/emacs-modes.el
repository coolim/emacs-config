;;; emacs-modes.el --- emacs-modes configuration
;;; Copyright (C) 2016 by KudzuValley


;; emacs 에서 각종 file format mode 에 대해서 정의한다.
;; file format 관련 mode 는 단순 highlight 기능만을 사용하기 때문에 따로 lisp 파일을
;; 작성하지 말고 emacs-modes.el 파일에 정의한다.

(emacs-require-packages '(actionscript-mode dts-mode))

;; ==================================
;; actionscript-mode
;; ==================================
(require 'actionscript-mode)

;; ==================================
;; dts-mode
;; ==================================
(require 'dts-mode)




(provide 'emacs-modes)
;;; emacs-modes.el ends here



