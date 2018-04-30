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



;;
;; c++, c style
;;

(defconst lim-c-style
  '((c-tab-always-indent . t)
    (c-comment-only-line-offset . 2)
    (c-hanging-braces-alist . ((substatement-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label after)
                               (access-label after)))
    (c-cleanup-list . (scope-operator
                       empty-defun-braces
                       defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
                        (substatement-open . 0)
                        (case-label . 0)
                        (block-open . 0)
                        (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "Kudzuvalley Style")


;;
;; Customizations for all modes in CC Mode.
;;

(defun my-c-mode-common-hook ()
  (c-add-style "PERSONAL" lim-c-style t)
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 4)
  (c-toggle-auto-state -1) ; disable auto-newline mode
  (c-toggle-hungry-state 1) ; enable hungry-delete mode
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map [(control c)(return)] 'ff-find-other-file)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'member-init-intro '++)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'comment-intro 0)
  (c-set-offset 'statement-case-open 4)
  (c-set-offset 'label 0)
  (c-set-offset 'arglist-intro '++)
  (hs-minor-mode 1))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;; 현재 폴더에 h, c 파일이 같이 있으면 바로 토클 오픈이 가능하도록 했다.
(add-hook 'c++-mode-hook
           '(lambda ()
              (define-key c-mode-base-map (kbd "M-o") 'ff-find-other-file)))
(add-hook 'c-mode-hook
           '(lambda ()
              (define-key c-mode-base-map (kbd "M-o") 'ff-find-other-file)))



(provide 'emacs-programming)
;;; emacs-programming.el ends here
