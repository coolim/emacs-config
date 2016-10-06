;;; emacs-dummy.el --- emacs-dummy configuration
;;; Copyright (C) 2016 by KudzuValley


(defun file-comment ()
  "lisp 파일을 만들고 file comment 를 단다."
  (interactive)
  (beginning-of-buffer)
  (insert (format ";;; %s" (file-name-nondirectory buffer-file-name))) ;; 현재 파일 이름만 가져온다.
  (insert (format " --- %s configuration\n" (file-name-base buffer-file-name)))
  (insert ";;; Copyright (C) 2016 by KudzuValley")
  (insert (format "\n\n\n\n\n(provide '%s)\n" (file-name-base buffer-file-name)))
  (insert (format ";;; %s ends here" (file-name-nondirectory buffer-file-name))))


(global-set-key (kbd "\C-cif")   'file-comment)


(provide 'emacs-dummy)

;;; emacs-dummy.el ends here
