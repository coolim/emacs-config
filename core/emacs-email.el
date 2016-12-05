;;; emacs-email.el --- emacs-email configuration
;;; Copyright (C) 2016 by KudzuValley


(setq user-mail-address "user@server.co.kr")
(setq mail-host-address "server.co.kr")



(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "mail.server.co.kr")
(setq smtpmail-smtp-server "mail.server.co.kr")
(setq smtpmail-local-domain "server.co.kr")
(setq smtpmail-sendto-domain "server.co.kr")
(setq smtpmail-debug-info t) ; only to debug problems
(setq smtpmail-auth-credentials
           '(("mail.server.co.kr" 25 "user@server.co.kr" "password")))




(provide 'emacs-email)
;;; emacs-email.el ends here
