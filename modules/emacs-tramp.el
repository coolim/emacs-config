;;; emacs-tramp.el --- emacs-tramp configuration
;;; Copyright (C) 2016 by KudzuValley

;; ================================================================================
;; tramp 관련 설정
;; ================================================================================
;;아래 방법처럼 하면 tramp 에서도 키를 가지고 접속을 할 수 있다.
;;기존 tramp 는 키를 가지고는 접속을 할 수 없으므로 아래 처럼 수정을해서 사용을 할 수 있다.
;;ssh -i <key path> root@<ip address>
;;/sshkey:root@<ip address>:/var/www/html/index.html
(require 'tramp)
(add-to-list 'tramp-methods '("sshkey"
			      (tramp-login-program "ssh")
			      (tramp-login-args (("-l" "%u") ("-p" "%p") ("-i" "/home/user/ssh.key") ("-e" "none") ("%h")))
			      (tramp-async-args (("-q")))
			      (tramp-remote-shell "/bin/sh")
			      (tramp-remote-shell-args ("-c"))
			      (tramp-gw-args (("-o" "GlobalKnownHostsFile=/dev/null")
					      ("-o" "UserKnownHostsFile=/dev/null")
					      ("-o" "StrictHostKeyChecking=no")))
			      (tramp-default-port 22)))


(provide 'emacs-tramp)
;;; emacs-tramp.el ends here
