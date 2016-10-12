;;; emacs-programming.el --- emacs-programming configuration
;;; Copyright (C) 2016 by KudzuValley

;;************************************************************
;;        P R O G R A M M I N G   M O D E
;;************************************************************
;;프로그래밍에 필요한 내용을 설정한다.


(add-hook 'c-mode-common-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|DONE\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))




(provide 'emacs-programming)
;;; emacs-programming.el ends here
