;;; emacs-theme.el --- emacs theme configuration
;;; Copyright (C) 2016 by KudzuValley

;; ************************************************************
;;        C O L O R   S E T T I N G   M O D E
;; ************************************************************
;; M + x color-theme-select 를 하면 각종 테마들이 많이 있다
;; emacs의 색상과 글꼴.. 어느 것을 바꾸어야 할지 감을 못잡을때... 
;; M-x list-faces-display
;; M-x list-colors-display

;; (color-theme-aliceblue)
;; (color-theme-blue)
;; (color-theme-vim-colors)
;; (color-theme-blue-mood)
;; (color-theme-arjen)		       
;; (color-theme-whateveryouwant)


(emacs-require-packages '(zenburn-theme solarized-theme material-theme dracula-theme sublime-themes))

;; (load-theme 'tango-dark)
;; (load-theme 'monokai t)
;; (load-theme 'tsdh-light)
;; (load-theme 'afternoon)
;; (load-theme 'ample-zen)
;; (load-theme 'badger)
;; (load-theme 'deeper-blue)
;;(load-theme 'misterioso)
;; (load-theme 'zenburn t)



(defconst emacs-theme-lists
  '(
  (load-theme 'adwaita t) 
  ;;(load-theme 'deeper-blue t) 
  (load-theme 'dichromacy t) 
  ;;(load-theme 'leuven t)
  (load-theme 'light-blue t) 
  ;; (load-theme 'manoj-dark t) 
  ;; (load-theme 'misterioso t) 
  ;;(load-theme 'solarized-dark t) 
  (load-theme 'solarized-light t) 
  (load-theme 'tango t) 
  ;; (load-theme 'tango-dark t) 
  ;; (load-theme 'tsdh-dark t) 
  (load-theme 'tsdh-light t) 
  ;; (load-theme 'wheatgrass t) 
  (load-theme 'whiteboard t) 
  (load-theme 'wombat t)
  ;; (load-theme 'material t)
  (load-theme 'material-light t)
  (load-theme 'dracula t) 
  ;; (load-theme 'zenburn t)
  ))


;; sublime themes
;; https://github.com/owainlewis/emacs-color-themes
;; 해당 테마는 아래와 같다.
;; brin granger spolsky graham odersky hickey fogus dorsey mccarthy
;; wilson junio
(defconst emacs-theme-sublime-themes
  '(
    (load-theme 'brin t)
    (load-theme 'granger t)
    (load-theme 'spolsky t)
    (load-theme 'graham t)
    (load-theme 'odersky t)
    (load-theme 'hickey t)
    (load-theme 'fogus t)
    (load-theme 'dorsey t)
    (load-theme 'mccarthy t)
    (load-theme 'wilson t)
    (load-theme 'junio t)
    ))

;; all themes
(defconst emacs-theme-all-themes
  '(
    (load-theme 'brin t)
    (load-theme 'granger t)
    (load-theme 'spolsky t)
    (load-theme 'graham t)
    (load-theme 'odersky t)
    (load-theme 'hickey t)
    (load-theme 'fogus t)
    (load-theme 'dorsey t)
    (load-theme 'mccarthy t)
    (load-theme 'wilson t)
    (load-theme 'junio t)
    (load-theme 'adwaita t) 
    (load-theme 'dichromacy t) 
    (load-theme 'light-blue t) 
    (load-theme 'solarized-light t) 
    (load-theme 'tango t) 
    (load-theme 'tsdh-light t) 
    (load-theme 'whiteboard t) 
    (load-theme 'wombat t)
    (load-theme 'material-light t)
    (load-theme 'dracula t) 
    ))




;; default random themes
;; (when (eq system-type 'gnu/linux)
;;   (eval (nth (random (length emacs-theme-lists)) emacs-theme-lists)))


;; sublime themes
;; (when (eq system-type 'gnu/linux)
;;   (eval (nth (random (length emacs-theme-sublime-themes)) emacs-theme-sublime-themes)))


;; all themes
(when (eq system-type 'gnu/linux)
  (eval (nth (random (length emacs-theme-sublime-themes)) emacs-theme-all-themes)))



;; 원래 위의 함수를 사용하면 되지만
;; 현재 random 으로 선택되어진 theme 이 무엇인지 알려고 setq 를 사용했다.
;; 지금은 custom-enabled-themes 을 사용하면 된다.
;; (when (eq system-type 'gnu/linux)
;;   (setq theme-num (nth (random (length emacs-theme-sublime-themes)) emacs-theme-sublime-themes))
;;   (message "%s" theme-num)
;;   (eval theme-num))


;; 현재 theme 표시
(message "------------ CURRENT THEME %s" custom-enabled-themes)


(defun current-theme ()
  "현재 적용되어진 테마를 보여준다."
  (switch-to-buffer "*scratch*" t)
  (insert (format "---- CURRENT THEME : %s" custom-enabled-themes)))
(current-theme)

;; (when (eq system-type 'gnu/linux)
;;   (load-theme 'zenburn t))

;; (when (eq system-type 'darwin)
;;   (load-theme 'zenburn t))

 ;; (setq mode-line-format
 ;;          (list
 ;;           ;; value of `mode-name'
 ;;           "%m: "
 ;;           ;; value of current buffer name
 ;;           "buffer %b, "
 ;;           ;; value of current line number
 ;;           "line %l "
 ;;           "-- user: "
 ;;           ;; value of user
 ;;           (getenv "USER")))


;; (setq mode-line-system-identification  
;;   (substring (system-name) 0
;;              (string-match "\\..+" (system-name))))


;; (setq default-mode-line-format
;;       (list ""
;;             'mode-line-modified
;;             "<"
;;             'mode-line-system-identification
;;             "> "
;;             "%14b"
;;             " "
;;             'default-directory
;;             " "
;;             "%[(" 
;;             'mode-name 
;;             'minor-mode-alist 
;;             "%n" 
;;             'mode-line-process  
;;             ")%]--" 
;;              "Line %l--"
;;             '(-3 . "%P")
;;             "-%-"))

;; ;; Start with new default.
;; (setq mode-line-format default-mode-line-format)


;; 아래 처럼 하면 minibuffer 에에 Directory: 라고 표시되고 directory 선택 창이 나온다.
;; 직접 아래 한줄을 실행해 보는게 빠르다.
;;(read-from-minibuffer "Directory: " default-directory)

;; 현재 theme 를 미니버퍼에 뿌린다.
;;(read-from-minibuffer (format "Current Theme: %s" custom-enabled-themes))

;; 현재 theme 을 대문자로 해서 가로 제거하고 보여준다.
;;(read-from-minibuffer (upcase (replace-regexp-in-string ")" "" (replace-regexp-in-string "(" "" (format "%s" custom-enabled-themes)))))


(provide 'emacs-theme)
;;; emacs-theme.el ends here
