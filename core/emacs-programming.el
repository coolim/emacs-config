;;; emacs-programming.el --- emacs-programming configuration
;;; Copyright (C) 2016 by KudzuValley


(add-hook 'c-mode-common-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|DONE\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))




(provide 'emacs-programming)
;;; emacs-programming.el ends here
