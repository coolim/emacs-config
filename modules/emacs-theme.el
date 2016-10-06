;;; emacs-theme.el --- emacs theme configuration
;;; Copyright (C) 2016 by KudzuValley

;; ************************************************************
;;        C O L O R   S E T T I N G   M O D E
;; ************************************************************
;; M + x color-theme-select 를 하면 각종 테마들이 많이 있다
;; emacs의 색상과 글꼴.. 어느 것을 바꾸어야 할지 감을 못잡을때... 
;; M-x list-faces-display
;; M-x list-colors-display

;; (color-theme-aliceblue)
;; (color-theme-blue)
;; (color-theme-vim-colors)
;; (color-theme-blue-mood)
;; (color-theme-arjen)		       
;; (color-theme-whateveryouwant)


(emacs-require-packages '(zenburn-theme solarized-theme))

;; (load-theme 'tango-dark)
;; (load-theme 'monokai t)
;; (load-theme 'tsdh-light)
;; (load-theme 'afternoon)
;; (load-theme 'ample-zen)
;; (load-theme 'badger)
;; (load-theme 'deeper-blue)
;;(load-theme 'misterioso)
;; (load-theme 'zenburn t)

(when (eq system-type 'gnu/linux)
  (load-theme 'zenburn t))

;; (when (eq system-type 'darwin)
;;   (load-theme 'zenburn t))

(provide 'emacs-theme)
;;; emacs-theme.el ends here
