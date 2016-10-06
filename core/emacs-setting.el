;;; emacs-setting.el --- Emacs default package selection.
;;; 임시로 작성한다.
(global-set-key "\C-c\C-f" 'grep-find)
;; 아래 것으로 grep-find 사용해 보자. 
;;; Grep is wicked
;; Grep/Find.  This needs some cleanup
(setq grep-command "grep -Irine ")
(setq grep-find-command
      (format "%s . -type f \\( -name '*~' -o -name '*#' -o -name '*.log' -o -path '*CVS/*' -o -path '*.svn/*' -o -path '*.git/*' -o -path '*vendor/*' -o -path '*build/*' -prune -o -print0 \\) | xargs -0 %s"
              find-program grep-command))

;; remove emacs init window
(setq inhibit-startup-message t)

;; get rid of scroll-bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; get rid of tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; get rid of menu-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; emacs 종료시 물어보고 'y' 입력시 종료한다.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "really kill emacs? "))
	    kill-emacs-query-functions))


;; 한글 입력을 세벌식 최종으로 설정한다. 
(setq default-korean-keyboard "3f") ;; 3벌식 최종
(setq default-input-method "korean-hangul3f")

;; Shift + Space  한영 전환키 설정한다.
(define-key global-map (kbd "S-SPC") 'toggle-input-method)
;; (global-set-key [?\S- ] 'toggle-input-method) ;; S-SPC

;; 상위 디렉토리를 갈 때 단축키 설정
(global-set-key [?\C-,] 'dired-up-directory)

;; Show matching parens
(show-paren-mode 1)


(fset 'yes-or-no-p 'y-or-n-p)

(icomplete-mode)

(setq make-backup-files nil)

;; ************************************************************
;;        F O N T S   S E T T I N G   M O D E
;; ************************************************************
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                  '("NanumGothicOTF" . "iso10646-1"))
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
                  '("NanumGothicOTF" . "iso10646-1"))
(set-fontset-font "fontset-default" 'kana
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'han
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'japanese-jisx0208
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'katakana-jisx0201
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))

(when (eq system-type 'gnu/linux)
  ;; default Latin font (e.g. Consolas)
  ;; but I use Monaco 
  (set-face-attribute 'default nil :family "Consolas")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 130)
  ;;(set-face-attribute 'default nil :weight 'bold)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;;(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  ;;(set-fontset-font t 'hangul (font-spec :name "나눔바른고딕" :size 20))
  (set-fontset-font t 'hangul (font-spec :name "나눔바른고딕"))
  ;; you may want to add different for other charset in this way.
  )

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; but I use Monaco
  (message "MAC System")
  (set-face-attribute 'default nil :family "Monaco")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 130)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

  ;; you may want to add different for other charset in this way.
  )



;; ================================================================================
;; 선택된 영역을 C-d 를 이용해서 지우기 위한 설정이다.
;; ================================================================================
;; delete it by typing the BS(DEL).
(delete-selection-mode t)


;; ================================================================================
;; TEXT 라인이 넘어도 자동으로 줄바꿈을 하지 않고 그대로 보여준다.
;; ================================================================================
(setq-default truncate-lines t)


;; ================================================================================
;; EMACS 상단의 제목에 현재 파일이름을 보여준다.
;; ================================================================================
(setq frame-title-format (list '(buffer-file-name "%f" "%b")))
(setq icon-title-format frame-title-format)


;; ================================================================================
;; 인코딩 설정
;; ================================================================================
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix) 
(setq default-keyboard-coding-system 'utf-8-unix) 
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)



;; ===================================================================================================
;; max window 를 단축키 설정한다.
;; ===================================================================================================
;; starting in fullscreen mode
;; 아래 내용만 있으면 시작하면서 maximize window 가 된다.
;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; 회면이 천체화면 으로 커진다.
;; (defun toggle-fullscreen ()
;;   "Toggle full screen on X11"
;;   (interactive)
;;   (when (eq window-system 'x)
;;     (set-frame-parameter
;;      nil 'fullscreen
;;      (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

;; (global-set-key [f11] 'toggle-fullscreen)
;; (global-set-key "\C-cwf" 'toggle-fullscreen)

(defun fullscreen (&optional f)
      (interactive)
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
       		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			     '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(when (eq window-system 'x)
  (global-set-key "\C-cwm" 'fullscreen))


(ido-mode t)




;; scratch buffer를 죽여도 계속 살리는 것인데
;; 나는 사용안하는 버퍼이니깐 일단 실행하지는 말자.
;; ;; Scratch buffer goodness

;; If the *scratch* buffer is killed, recreate it automatically
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)


;; =======================================
;; magit
;; =======================================
(global-set-key "\C-xg" 'magit-status)



;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)


(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))




(provide 'emacs-setting)
;;; emacs-setting.el ends here





