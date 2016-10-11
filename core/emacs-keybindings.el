;;; emacs-keybindings.el --- emacs-keybindings configuration
;;; Copyright (C) 2016 by KudzuValley


(global-set-key "\C-c\C-f" 'grep-find)


;; Shift + Space  한영 전환키 설정한다.
(define-key global-map (kbd "S-SPC") 'toggle-input-method)
;; (global-set-key [?\S- ] 'toggle-input-method) ;; S-SPC


;; 상위 디렉토리를 갈 때 단축키 설정
(global-set-key [?\C-,] 'dired-up-directory)





(provide 'emacs-keybindings)
;;; emacs-keybindings.el ends here
