;;; emacs-helm.el --- emacs-helm configuration
;;; Copyright (C) 2016 by KudzuValley

;; ==================================
;; helm 
;; ==================================


(emacs-require-packages '(helm))


(require 'helm-config)
(setq helm-idel-delay 0.1)
(setq helm-input-idle-delay 0.1)

(global-set-key (kbd "M-t") 'helm-for-files)

(require 'helm-files)
(global-set-key [f12] 'helm-recentf)


(setq helm-ff-file-name-history-use-recentf t)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(setq recentf-auto-cleanup 'never)
;;(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
(setq recentf-auto-save-timer (run-with-idle-timer 300 t 'recentf-save-list))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-c f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c h") 'helm-mini)

;; icomplete-mode 를 사용하다 나중에 하고 싶으면 다시 사용하자.
;; M-x 를 하면 helm 창이 뜨는 기능이다.
;; (global-set-key (kbd "M-x") 'helm-M-x)


(provide 'emacs-helm)
;;; emacs-helm.el ends here
