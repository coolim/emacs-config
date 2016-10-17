;;; emacs-keybindings.el --- emacs-keybindings configuration
;;; Copyright (C) 2016 by KudzuValley


(global-set-key "\C-c\C-f" 'grep-find)


;; Shift + Space  한영 전환키 설정한다.
(define-key global-map (kbd "S-SPC") 'toggle-input-method)
;; (global-set-key [?\S- ] 'toggle-input-method) ;; S-SPC


;; 상위 디렉토리를 갈 때 단축키 설정
(global-set-key [?\C-,] 'dired-up-directory)


;;************************************************************
;;        K E Y    B I N D S
;;************************************************************

(global-set-key "\C-cc" 'compile)
(global-set-key "\C-c\C-f" 'grep-find)
;; (global-set-key "\C-cd" 'gud-gdb)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


;; (global-set-key [up] '(lambda () (interactive) (scroll-down 1)))
;; (global-set-key [down] '(lambda () (interactive) (scroll-up 1)))


(define-key global-map (kbd "RET") 'newline-and-indent)
;; (defun set-newline-and-indent ()
;;   (local-set-key (kbd "RET") 'newline-and-indent))

;; (add-hook 'lisp-mode-hook 'set-newline-and-indent)
;; (add-hook 'nxml-mode-hook 'set-newline-and-indent)


;; Now we can bind to this function:
(global-set-key "\C-xp" 'other-window-backward)


;; ===================================================================================================
;; 현재 버퍼를 지운다.
;; ===================================================================================================
(global-set-key "\C-cbe" 'erase-buffer)


;; ================================================================================
;; TAGS Setting
;; ================================================================================
(fset 'find-next-tag "\C-u\256")
(fset 'find-prev-tag "\C-u-\256")
(global-set-key "\M-]" 'find-next-tag)
(global-set-key "\M-[" 'find-prev-tag)



;; for gdb and grep-mode
;;(global-set-key "\C-x\C-n" 'next-error)
;;(global-set-key "\C-xn" 'next-error)
(global-set-key [C-up] 'previous-error)
(global-set-key [C-down] 'next-error)


;; ===================================================================================================
;; C-u M-x shell 을 대신하는 명령이다. Custom Shell 을 자주 사용하니 아래 키 바인딩을 이용하자.
;; ===================================================================================================
(global-set-key "\C-csh" 'my-named-shell)


;; ===================================================================================================
;; 해당하는 가로의 짝을 자동으로 찾는다.
;; ===================================================================================================
(global-set-key (kbd "\C-]") 'match-paren)


;;; lisp file 을 만들었을 때 기본 설명과 provide 를 자동 생성하게 만들었다.
(global-set-key (kbd "\C-cif")   'file-comment)



(global-set-key (kbd "\C-cis") 'insert-code-modify-Begin)
(global-set-key (kbd "\C-cie") 'insert-code-modify-End)
;;(global-set-key (kbd "\C-cif") 'insert-code-modify-Full)


;; get current buffer path
(global-set-key (kbd "\C-cip") 'copy-to-buffer-filename)


(eval-after-load "dired" '(progn
			    (define-key dired-mode-map (kbd "e") 'dired-open-thunar) ))


(eval-after-load "dired" '(progn
			    (define-key dired-mode-map (kbd "e") 'dired-open-nemo) ))

(eval-after-load "dired" '(progn
			    (define-key dired-mode-map (kbd "e") 'dired-open-nautilus)))



(add-hook 'c-mode-hook (lambda () (define-key c-mode-base-map "\C-c\C-s" 'function-start-end)))
(add-hook 'c++-mode-hook (lambda () (define-key c++-mode-map "\C-c\C-s" 'function-start-end)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-s" 'function-start-end)))


;;(add-hook 'prog-mode-hook (lambda () (define-key prog-mode-map "\C-c\C-s" 'function-start-end)))


(global-set-key "\C-cws" 'toggle-window-split)
(global-set-key "\C-cwr" 'rotate-windows)


;;(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)
(global-set-key (kbd "C-x F") 'sudo-find-file)


(global-set-key "\C-x\C-yw" 'word-count)


(provide 'emacs-keybindings)
;;; emacs-keybindings.el ends here
