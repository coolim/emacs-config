;;; emacs-lusty.el --- emacs-lusty configuration
;;; Copyright (C) 2016 by KudzuValley

(when (require 'lusty-explorer nil 'noerror)
;;   ;; overrride the normal file-opening, buffer switching
;;   (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-x b")   'lusty-buffer-explorer))


(provide 'emacs-lusty)
;;; emacs-lusty.el ends here


