;;; emacs-vcs.el --- emacs-vcs configuration
;;; Copyright (C) 2016 by KudzuValley

(emacs-require-packages '(psvn magit))
;; ================================================================================
;; psvn
;; ================================================================================
;; http://www.xsteve.at/prg/emacs/psvn.el

(require 'psvn)
(setq svn-status-default-diff-arguments '("--diff-cmd" "diff" ))
;; (setq svn-status-default-diff-arguments (quote ("--diff-cmd" "diff" "-x" "-wbBu")))
(setq svn-status-verbose nil)
;; 좌축 하단에 svn edit 표시의 아이콘 표시 여부를 결정한다.
;; (setq vc-handled-backends nil)  ;; disable vc 
(setq vc-svn-diff-switches nil) ;; disable colordiff

(defun switch-to-svn-status-buffer ()
  "*svn-status* 버퍼가 있으면 스위칭, 없으면 svn-status 실행"
  (interactive)
  (if (remove-if-not #'(lambda (x) (string-equal "*svn-status*" x))
                     (mapcar #'buffer-name (buffer-list)))
      (switch-to-buffer "*svn-status*")
    (call-interactively 'svn-status)))
;; (global-set-key [(f12)] 'switch-to-svn-status-buffer)
(global-set-key "\C-cps" 'switch-to-svn-status-buffer) 
(global-set-key "\C-xs" 'switch-to-svn-status-buffer)

(add-hook 'svn-status-mode-hook  (lambda() (hl-line-mode)))



;; =======================================
;; magit
;; =======================================
(global-set-key "\C-xg" 'magit-status)



(provide 'emacs-vcs)
;;; emacs-vcs.el ends here
