;;; emacs-email.el --- emacs-email configuration
;;; Copyright (C) 2016 by KudzuValley


(setq user-mail-address "yhlim@hutek.net")
(setq mail-host-address "hutek.net")



(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "mail.hutek.net")
(setq smtpmail-smtp-server "mail.hutek.net")
(setq smtpmail-local-domain "hutek.net")
(setq smtpmail-sendto-domain "hutek.net")
(setq smtpmail-debug-info t) ; only to debug problems

;; 실제 smtp 설정이다. 아래 처럼 하면된다.
;; (setq smtpmail-auth-credentials
;;            '(("mail.server.co.kr" 25 "user@server.co.kr" "password")))

;; 계정 정보가 노출이 되는 문제가 발생되기 때문에 아래 처럼 해야 한다.
(setq smtpmail-auth-credentials (expand-file-name "~/.authinfo"))

;; authinfo 형식은 아래와 같다.
;;  
;;  machine mail.nemustech.com login MyEmailAddress password MyPassWord port 993
;;
;; example
;; machine mail.server.net login user@server.net port 25 password userpassword

(provide 'emacs-email)
;;; emacs-email.el ends here
