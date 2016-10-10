;;; emacs-redo.el --- emacs-redo configuration
;;; Copyright (C) 2016 by KudzuValley


(emacs-require-packages '(redo+))
;; ==================================
;; redo+
;; ==================================
(require 'redo+)
(global-set-key [(meta backspace)] 'undo)
(global-set-key [(meta shift backspace)] 'redo)



(provide 'emacs-redo)
;;; emacs-redo.el ends here
