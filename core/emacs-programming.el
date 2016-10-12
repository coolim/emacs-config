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


;; TODO, BUG 등에 강조표시
(font-lock-add-keywords 'c++-mode
                        '(("\\<\\(FIXME\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(TODO\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(BUG\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(NOTE\\):" 1 c-nonbreakable-space-face prepend)))
(font-lock-add-keywords 'c-mode
                        '(("\\<\\(FIXME\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(TODO\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(BUG\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(NOTE\\):" 1 c-nonbreakable-space-face prepend)))





(provide 'emacs-programming)
;;; emacs-programming.el ends here
