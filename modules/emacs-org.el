;;; emacs-org.el --- emacs-org configuration
;;; Copyright (C) 2016 by KudzuValley


;; ==================================
;; org-mode
;; ==================================
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook  (lambda() (hl-line-mode)))

;; org mode 에서 auto-fill 이 되면 귀찮다.
(add-hook 'org-mode-hook '(auto-fill-mode -1))

;; org agenda 가 필요하면 아래처럼 특정파일을 지정하면 된다.
;; (setq org-agenda-files (list "~/workspace/workspace_git/pm_docs/TUNEProjects.org"
;; 			     "~/workspace/workspace_git/pm_docs/TUNETODOList.org"))

;; (setq org-agenda-files 
;;       (directory-files (expand-file-name "~/workspace/org/") t "^.*\\.org$"))


;; org-mode export를 할 때 맨 마지막 줄에 Validate XHTML 1.0 을 제거한다.
;; org version 8.0 이하일때 사용 
(setq org-export-html-validation-link nil)

;; org version 8.0
(setq org-html-validation-link nil)

;;  아래 설정을 해야 begin_src 에서 언어를 설정하면 code 들이 실시간으로 highlighting 이 되어진다.
(setq org-src-fontify-natively t)


;;;; markdown 모드는 export 메뉴에서 보려면 아래 설정을 해야 한다.
(eval-after-load "org"
  '(require 'ox-md nil t))

(require 'org-install)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '(
;;    (sh . t)
;;    (python . t)
;;    (R . t)
;;    (ruby . t)
;;    (ditaa . t)
;;    (dot . t)
;;    (octave . t)
;;    (sqlite . t)
;;    (perl . t)
;;    ))

;; org-remember 를 하고 나면 ~/.notes 파일로 존재한다.
;; 그러므로 .notes 를 org-mode 로 만든다.
;; 상위 버전에서 더이상 org-remember 가 존재하지 않는다. 왜????? 모른다.

;;(global-set-key "\C-cr" 'org-remember)
;;(add-to-list 'auto-mode-alist '("\\.notes" . org-mode))


;; (defun my-org-inline-css-hook (exporter)
;;   "Insert custom inline css"
;;   (when (eq exporter 'html)
;;     (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
;;            (path (concat dir "style.css"))
;;            (homestyle (or (null dir) (null (file-exists-p path))))
;;            (final (if homestyle "~/.emacs.d/org-style.css" path)))
;;       (setq org-html-head-include-default-style nil)
;;       (setq org-html-head (concat
;;                            "<style type=\"text/css\">\n"
;;                            "<!--/*--><![CDATA[/*><!--*/\n"
;;                            (with-temp-buffer
;;                              (insert-file-contents final)
;;                              (buffer-string))
;;                            "/*]]>*/-->\n"
;;                            "</style>\n")))))

;; (eval-after-load 'ox
;;   '(progn
;;      (add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)))





(provide 'emacs-org)
;;; emacs-org.el ends here
