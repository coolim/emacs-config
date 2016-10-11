;;; emacs-modules.el --- Emacs Load Modules
;; emacs 에서 사용하고자 하는 modules 을 정의하고
;; 사용하고 싶은것만 사용하자.


;; file format highlight
(require 'emacs-modes)

(require 'emacs-autopair)

(require 'emacs-ido)

;;(require 'emacs-yasnippet)

(require 'emacs-window-number)

(require 'emacs-theme)

(require 'emacs-registers)

(require 'emacs-dummy)

(require 'emacs-lusty)

(require 'emacs-php)

(require 'emacs-helm)

;; 자동 완성 팝업을 사용한다.
(require 'emacs-company)

(require 'emacs-redo)

(require 'emacs-vcs)

(require 'emacs-org)

(require 'emacs-cscope)

(require 'emacs-web)

;;; emacs-modules.el ends here
