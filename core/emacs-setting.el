;;; emacs-setting.el --- Emacs default package selection.
;;; Copyright (C) 2016 by KudzuValley


;;************************************************************
;;         E M A C S    S E T T I N G S
;;************************************************************

;; remove emacs init window
(setq inhibit-startup-message t)

;; get rid of scroll-bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; get rid of tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; get rid of menu-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;ido 나 helm 을 사용중이기 때문에 필요없다.
;;기본적으로는 괜찮은 mode이다.
;;(icomplete-mode 1)

;; get rid of icomplete
(if (fboundp 'icomplete-mode) (icomplete-mode -1))


;; emacs 종료시 물어보고 'y' 입력시 종료한다.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "really kill emacs? "))
	    kill-emacs-query-functions))


;; 한글 입력을 세벌식 최종으로 설정한다. 
(setq default-korean-keyboard "3f") ;; 3벌식 최종
(setq default-input-method "korean-hangul3f")


;; Show matching parens
(show-paren-mode 1)


;; yes, no 등을 간단하게 y 나 n 로 바꾼다.
(fset 'yes-or-no-p 'y-or-n-p)


;; ================================================================================
;;; Enable functions that are disabled by default
;; ================================================================================
;; Enable the command `narrow-to-region' ("C-x n n"), a useful
;; command, but possibly confusing to a new user, so it's disabled by default.

;; vi는 block 설정 후(v, Shift-V, Ctrl-V) block에 있는 단어를 바로 바꿀 수 있다(:s).
;; vi보다 조금 복잡하지만 Emacs에도 같은 기능이 있다.
;; 1. Mark set'C-SPC', 'C-@'를 이용하여 mark 설정한다.
;; 2. narrow-to-region (C-x n n)'M-x narrow-to-region'을 실행하여 mark설정한 부분만 작업을 할 수 있도록 한다.
;; 3. Query replace
;;    'M-%'로 문자 치환한다.
;; 4. widen (C-x n w)'M-x widen'으로 원래 화면으로 전환한다.


;; Restrict buffer editing to a region
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; Upcase and downcase regions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Sets the current horizontal position for C-n and C-p
(put 'set-goal-column 'disabled nil)

;; Dired functions
(put 'dired-find-alternate-file 'disabled nil)

;; narrow-to-region	C-x n n
;; narrow-to-page	C-x n p
;; narrow-to-defun	C-x n d
;; everything	widen	C-x n w


;; ================================================================================
;; 바뀐 부분이 있으면 자동으로 reload를 해 준다.
;; ================================================================================
(global-auto-revert-mode 1)

;; ================================================================================
;; 아래 행과 열이 표시된다.
;; ================================================================================
(column-number-mode t)

;; ================================================================================
;; 아래 시간이 표시된다.
;; ================================================================================
;;(display-time-mode t)

;; display time format
(setq display-time-day-and-date t
      display-time-24hr-format t
      display-time-use-mail-icon t
      display-time-mail-file nil)

;; display time 
(display-time)


;; ================================================================================
;; 아래 줄과 칸이 표시된다.
;; ================================================================================
(line-number-mode t)

;; ================================================================================
;; 현재 커서의 함수명을 표시한다.
;; ================================================================================
;; 아래 함수 때문에 grep 을 하면 문제가 발생을 한다. 로딩이 잘 되지 않는다.
;; 나중에 다시 확인해 보자.
(which-function-mode t)

;; ================================================================================
;; 이미지 파일을 볼 수 있게 해 준다.
(auto-image-file-mode t)
;; ================================================================================

;; ================================================================================
;; 압축파일을 볼 수 있게 해 준다.
;; ================================================================================
;; Automatic opening of zipped files.
(auto-compression-mode t)

;; ================================================================================
;; no beep sound
;; ================================================================================
(setq visible-bell t)


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
;; A string is printed verbatim in the mode line except for %-constructs:
;;     (%-constructs are allowed when the string is the entire mode-line-format
;;      or when it is found in a cons-cell or a list)
;;     %b -- print buffer name.      %f -- print visited file name.
;;     %F -- print frame name.
;;     %* -- print %, * or hyphen.   %+ -- print *, % or hyphen.
;;           %& is like %*, but ignore read-only-ness.
;;           % means buffer is read-only and * means it is modified.
;;           For a modified read-only buffer, %* gives % and %+ gives *.
;;     %s -- print process status.
;;     %p -- print percent of buffer above top of window, or Top, Bot or All.
;;     %P -- print percent of buffer above bottom of window, perhaps plus Top,
;;           or print Bottom or All.
;;     %m -- print the mode name.
;;     %n -- print Narrow if appropriate.
;;     %z -- print mnemonics of buffer, terminal, and keyboard coding systems.
;;     %Z -- like %z, but including the end-of-line format.
;;     %[ -- print one [ for each recursive editing level.  %] similar.
;;     %% -- print %.   %- -- print infinitely many dashes.
;;   Decimal digits after the % specify field width to which to pad.

;; emacs title 이다.
(setq frame-title-format (list '(buffer-file-name "%f")))
;; (setq frame-title-format (format "%%f - %%s %s" custom-enabled-themes))
;; (setq frame-title-format (format "%%f - %%m,    Theme : %s" custom-enabled-themes))

(setq frame-title-format
         '(buffer-file-name "%f"
            (dired-directory dired-directory "%b")))

;; emacs 실행해서 icon 상태에서의 문자열이다.
(setq icon-title-format frame-title-format)

;; (setq frame-title-format
;;           (setq icon-title-format
;;                 (format "%%b - %semacs" custom-enabled-themes)))
;; (setq frame-title-format (format "%%b - %semacs" custom-enabled-themes))

;;(setq frame-title-format (format "%%f - %%s %s" custom-enabled-themes))




;; ================================================================================
;; backup 
;; ================================================================================
;; 현재는 사용하지 않는다.
(setq make-backup-files nil)

;; (setq make-backup-files t   ; do make backups
;;       backup-directory-alist '(("." . "~/.emacs.d/.emacs_backup/"))
;;       version-control t                      ; 백업을 여러번 한다
;;       kept-old-versions 10                    ; oldest 백업 10개는 유지
;;       kept-new-versions 10                    ; newest 백업 10개 유지
;;       delete-old-versions t)                 ; 지울때마다 묻지 않는다.



;; ================================================================================
;; 인코딩 설정
;; ================================================================================
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix) 
(setq default-keyboard-coding-system 'utf-8-unix) 
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)


;; kill ring max 값 설정 기본은 60이다.
(setq kill-ring-max 1024)

;; for lisp nesting exceeds error
;; maybye emacs default 400
;; ntemacs default 1000
;; lisp 최대 실행 깊이 default 는 500
;; 몰까?
(setq max-lisp-eval-depth 40000) 

;; 최대 용량 default 1000
;; 무엇에 대한 최대 용량인지 모른다?? 
(setq max-specpdl-size 10000)

;; 버퍼 용량을 120M 로 정의했다.
;; 용량이 작으면 계속 warning error 가 발생을 한다.
;; default 는 12M 이다.
(setq undo-outer-limit 1200000000)


;; 기본적으로 가비지 콜렉션을 실행하기 위한 사이즈를 늘린다.
;; 이러면 lisp을 실행하는 로딩시간이 짧아진다.
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)
;; (setq garbage-collection-messages t)



;; 용량이 큰 파일을 열 때 물어본다. 이것을 100MB 로 설정한다.
;; warn when opening files bigger than 100MB (default 10MB)
(setq large-file-warning-threshold 100000000)




;; ================================================================================
;; dired 모드에서의 파일 표시방식을 정한다.
;; ================================================================================
;;;;; dired-mode 의 기본 옵션은 ls -la 과 동일하다.
;;;;; 이걸 변경하고 싶으면 C-u s 를 해 보면
;;;;; -al 과 갈이 되어 있을 것이다. 이것을 변경을 하면 된다.
;;; --group-directories-first 는 먼저 디렉토리 먼저 보여준다.
;;; 원래는 디렉토리와 파일을 구분없이 보여 주기 때문에 이상한 부분이 있다.
;;(setq dired-listing-switches "-aBhl  --group-directories-first")
;; mac 일 때는 --group-directories-first 옵션이 없다.
;; 그래서 C-x d 가 즉, 디렉토리 리스팅이 되지 않는다.
;; darwin 일 때는 사용하지 않는다.
(unless (eq system-type 'darwin)
  (setq dired-listing-switches "-aBl  --group-directories-first"))
;; (setq dired-listing-switches "-aBlgh")
;;(setq dired-listing-switches "-Blh")
;; (setq dired-listing-switches "-Blha")


;; ================================================================================
;; ALT + [Up Down Left Right]키로 창을 이동할 수 있다.
;; ================================================================================
(windmove-default-keybindings 'meta)



;; ==================================
;; Smooth scroll
;; ==================================
;;; emacs 에서는 scroll down 중에 커서가 맨 밑으로 가면 다시 중간으로 온다.
;;; 이 기능이 있으면 불편해서 없앤다.
;; smooth scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

; scroll just one line when hitting the bottom of the window center
(setq scroll-step 1)


;; ==================================
;; saveplace
;; ==================================
;; 마지막 커서 위치 저장을 한다.
;; 파일을 다시 열면 이전위치로 자동이동한다.
;; Emacs 24.5 and older versions
;; (require 'saveplace)
;; (setq-default save-place t)

;; Emacs 25.1 and newwer versions
;; (save-place-mode 1)

(if (version< "25.1" emacs-version)
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))


;; ==================================
;; Grep Find
;; ==================================
;; 원래 쓰던 grep-find-command 인데 다른것으로 사용해 보자. 
;; (setq grep-find-command
;;       "find . -name \"*\" -not -path \"*svn*\" -not -path \"*elpa*\"  -not -path \"*git*\" -not -path \"*out*\" -not -name \"TAGS\" -not -name \"cscope.*\" -not -name \"*.so*\" -not -name \"*.o\" -not -name \"*.P\" -not -name \"*.d\" -not -name \"*.apk\" -not -name \"*.img\" -not -name \"*.a\"  -type f -print0 | xargs -0 -e grep -ni -e ")

(setq grep-find-command
      "find . -name \"*\" -not -name \"TAGS\" -not -name \"cscope.*\" -type f -print0 | xargs -0 -e grep -ni -e ")


;; 아래 것으로 grep-find 사용해 보자. 
;;; Grep is wicked
;; Grep/Find.  This needs some cleanup
;; (setq grep-command "grep -Irine ")
;; (setq grep-find-command
;;       (format "%s . -type f \\( -name '*.o' -o -name '*.o.cmd' -o -name 'TAGS' -o -name '*~' -o -name '*#' -o -name '*.log' -o -name 'cscope.*' -o -path '*CVS/*' -o -path '*.svn/*' -o -path '*.git/*' -o -path '*out/*' -o -path '*development/*' -o -path '*ndk/*' -o -path '*sdk/*' -o -path '*vendor/*' -o -path '*build/*' -prune -o -print0 \\) | xargs -0 %s"
;;               find-program grep-command))


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


(when (eq window-system 'ns)
  (global-set-key "\C-cwm" 'toggle-frame-maximized))



;; ===================================================================================================
;; Zombie *scratch* buffer
;; ===================================================================================================
;; scratch buffer를 죽여도 계속 살리는 것인데 좋다.
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

;; git 에서 명령어를 사용하면 
;; WARNING: terminal is not fully functional
;; -  (press RETURN)
;; 이와 같은 현상이 발생하며 Enter 를 한번 더 해야 정상 화면이 보여지는 경우가 생긴다.
;; 이럴 경우 터미널에서 아래 설정을 하면 된다. 아래 명령은 git 에만 적용하는게 아닌것 같지만 확인해 보지는 않았다.
;; export PAGER=cat
;; 적어도 git 같은 경우는 아래 명령을 사용하면 되고 
;;(setenv "GIT_PAGER" "")
;; 현재는 아래 명령을 사용하고 있다.
(setenv "GIT_PAGER" "nkf -w|colordiff")




(provide 'emacs-setting)
;;; emacs-setting.el ends here







