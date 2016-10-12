;;; emacs-tips.el --- emacs-tips configuration
;;; Copyright (C) 2016 by KudzuValley

;; ************************************************************
;;    E M A C S     T I P S
;; ************************************************************
;; emacs 관련 각종 팁들은 서술한다.


;; C-x C-; 는 한 줄 코멘트



;;gdb --fullname permission.sh
;; (custom-set-variables
;;    '(gud-gud-gdb-command-name "gdb --annotate=3 /home/coolim/workspace/xbmc-13.1-Gotham/xbmc.bin")
;; )


;; ===================================================================================================
;; HTTP GET POST 를 구현해봤다.
;; ===================================================================================================
(defun my-url-http-post (url args)
  "Send ARGS to URL as a POST request."
  (let ((url-request-method "POST")
	(url-request-extra-headers
	 '(("Content-Type" . "application/x-www-form-urlencoded; charset=UTF-8")
	   ("Host" . "192.168.123.13:9981")
	   ("User-Agent" . "Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0")
	   ("Accept-Encoding" . "gzip, deflate")
	   ("X-Requested-With" . "XMLHttpRequest")
	   ("Referer" . "http://192.168.123.13:9981/extjs.html")
	   ("Content-Length" . "80")
	   ("Connection" . "keep-alive")
	   ("Pragma" . "no-cache")
	   ("Cache-Control" . "no-cache")))
	
	(url-request-data
	 (mapconcat (lambda (arg)
		      (concat (url-hexify-string (car arg))
			      "="
			      (url-hexify-string (cdr arg))))
		    args
		    "&")))
    ;; if you want, replace `my-switch-to-url-buffer' with `my-kill-url-buffer'
    (url-retrieve url 'my-switch-to-url-buffer)))

(defun my-kill-url-buffer (status)
  "Kill the buffer returned by `url-retrieve'."
  (kill-buffer (current-buffer)))

(defun my-switch-to-url-buffer (status)
  "Switch to the buffer returned by `url-retreive'.
    The buffer contains the raw HTTP response sent by the server."
  (switch-to-buffer (current-buffer)))

;; (my-url-http-post "http://192.168.123.13:9981/tablemgr" '(("op" . "get") ("table" . "dvbsatconf/_dev_dvb_adapter0_TurboSight_TBS_5922_DVBS_S2_frontend")))


;; (defun my-http-post1 ()
;;   (interactive)
;;   (my-url-http-post "http://192.168.123.13:9981/tablemgr" '(("op" . "get") ("table" . "dvbsatconf/_dev_dvb_adapter0_TurboSight_TBS_5922_DVBS_S2_frontend"))))


;; 시스템의 한/영 을 그대로 사용한다.
;; ~/.Xresources 파일 작성후 아래 내용을 설정한다.
;; --------------------------------
;; emacs.useXIM:false
;; emacs24.useXIM:false
;; emacs25.useXIM:false
;; --------------------------------
;; 작성후 아래 shell 에서 아래 명령 작성하면 바로 적용가능하다.
;; xrdb -merge ~/.Xresources 
;;
;;

;;----------------------- xmodmap start ------------------------------
;; Emacs를 이용하여 장시간 작업을 하면 왼손 새끼 손가락을
;; 많이 사용하기 때문에 욱신 거린다.
;; 아래와 같이 xmodmap을 이용하여 CapsLock을 Control키 처럼
;; 사용할 수 있도록 변경하면 왼손 새끼 손가락의 고통을 조금 덜 수 있다.
;;    1. CapsLock을 제거
;;      xmodmap -e "remove lock = Caps_Lock"
;;    2. CapsLock을 Control처럼 사용할 수 있도록 설정
;;      xmodmap -e "add control = Caps_Lock"

;; 위 작업을 로그인할 때마다 하기 귀찮으니 홈 디렉토리
;; .Xmodmap파일에 아래와 같이 등록을 하면 편하다.
;;    [ ~/.Xmodmap ]
;;    remove lock = Caps_Lock
;;    add control = Caps_Lock
;;----------------------- xmodmap end ------------------------------


;;;;;;;;;;; org-mode Easy Templates
;; s	#+BEGIN_SRC ... #+END_SRC 
;; e	#+BEGIN_EXAMPLE ... #+END_EXAMPLE
;; q	#+BEGIN_QUOTE ... #+END_QUOTE 
;; v	#+BEGIN_VERSE ... #+END_VERSE 
;; c	#+BEGIN_CENTER ... #+END_CENTER 
;; l	#+BEGIN_LaTeX ... #+END_LaTeX 
;; L	#+LaTeX: 
;; h	#+BEGIN_HTML ... #+END_HTML 
;; H	#+HTML: 
;; a	#+BEGIN_ASCII ... #+END_ASCII 
;; A	#+ASCII: 
;; i	#+INDEX: line 
;; I	#+INCLUDE: line


;; M + x color-theme-select 를 하면 각종 테마들이 많이 있다
;; emacs의 색상과 글꼴.. 어느 것을 바꾸어야 할지 감을 못잡을때... 
;; M-x list-faces-display
;; M-x list-colors-display


;; scratch 에 아래 내용을 복사하고 C-x C-e 를 하면 자동 설치를 한다.
;; (progn
;;   (package-refresh-contents)
;;   (package-install 'monokai-theme))


;; 파일 엔코딩 변환하기
;; M-x revert-buffer-with-coding-system 잘 된다.
;; C-x RET r 해보지 않았다.  같은 기능이니깐 잘되겠지 



;; /*
;;  * Local Variables:
;;  * c-file-style: "linux"
;;  * indent-tabs-mode: t
;;  * tab-width: 8
;;  * End:
;;  */




;; 일반 파일에도 아래외 같이 새용 할 수 가 있다.
;; 나중에 필요하면 한번 사용해 보자.
;;
;; 파일 서두에 timestamp 를 정의하고나서 사용하면 아래처럼 파일이 write 될 때마다 값이 바뀐다.
;; 지금 확인해 보니 아무 파일에서나 사용할 수 있다.
;;
;;
;; timestamp='2015-08-21'
;; 
;; # Local variables:
;; # eval: (add-hook 'write-file-hooks 'time-stamp)
;; # time-stamp-start: "timestamp='"
;; # time-stamp-format: "%:y-%02m-%02d"
;; # time-stamp-end: "'"
;; # End:


;; -*- mode: compilation; default-directory: "~/workspace/workspace_igengard/igengard/project/cmake/scripts/common/" -*-



;; 
;; (setq python-shell-interpreter "ipython"
;;        python-shell-interpreter-args "-i")
;;
;; C-c C-p 로 하면 *python* 창이 생긴다. 이걸로 실행하기. 
;; C-c C-c 를 하면 python 실행 - 현재 실행하고자 하는 파일의 전용 인터프리터 창이 생기는것 같다. 
;; C-c C-z 를 하면 python interpreter 창으로 전환 python-shell-switch-to-shell

;; C-C C-v
;; sudo apt-get install pyflakes
;; pyflakes 를 가지고 테스트가 가능하다.
;; 임의의 컴파일이라고 생각해도 된다.
;; 
;; python document
;; (elpy-enable)


;;;; example 현재 시스템이 뭔지 알아보자.
;; (defun xah-open-in-terminal ()
;;   "Open the current dir in a new terminal window.
;; URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
;; Version 2015-12-10"
;;   (interactive)
;;   (cond
;;    ((string-equal system-type "windows-nt")
;;     (message "Microsoft Windows not supported. File a bug report or pull request."))
;;    ((string-equal system-type "darwin")
;;     (message "Mac not supported. File a bug report or pull request."))
;;    ((string-equal system-type "gnu/linux")
;;     (let ((process-connection-type nil))
;;       (start-process "" nil "x-terminal-emulator"
;;                      (concat "--working-directory=" default-directory) )))))


;; 아래가 뭔지 파악하자.
;; isearch-occur
;; occur


;; ------------------------------------------------------------------------------------------------
;; org-mode를 custom 할 수 있는 것들을 모아 놓았다. 나중에 필요할 때 사용해 보자.

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.

;;  '(org-level-1  ((t (:weight bold))))                          ;; bold

;;  ;; normal text
;;  ;; '(org-level-2  ((t nil)))          ;; normal text
;;  ;; Use the following complicated format because the above line does not work very well
;;  ;; with column view (in org-mode 5.12c)
;;  '(org-level-2  ((((background light)) (:foreground "#000000")) ;; black (with light background)
;;                  (t (:foreground "#F0F0F0"))))                  ;; white (with dark background)

;;  '(org-level-3  ((t (:foreground "#800000"))))                 ;; dark red
;;  '(org-level-4  ((t (:foreground "#0000FF"))))                 ;; blue
;;  '(org-level-5  ((t (:foreground "#006000"))))                 ;; dark green
;;  '(org-level-6  ((t (:foreground "#B020A0"))))                 ;; purple
;;  '(org-level-7  ((t (:foreground "#0060C0"))))                 ;; green blue
;;  '(org-level-8  ((t (:foreground "#4030C0"))))                 ;; purple blue

;;  '(org-agenda-structure ((t (:foreground "#0040C0" :weight bold)))) ;; dark green blue
;;  '(org-agenda-date ((t (:foreground "#800000" :weight bold)))) ;; dark red
;;  '(org-agenda-date-weekend ((t (:foreground "#006000" :weight bold)))) ;; dark green
;;  '(org-scheduled-today ((t (:foreground "#0000FF")))) ;; bright blue
;;  '(org-scheduled-previously ((t (:foreground "#181880")))) ;; dark green blue
;;  '(org-upcoming-deadline ((t (:foreground "#C00000")))) ;; middle red
;;  '(org-warning ((t (:foreground "#C00000" :weight bold)))) ;; bold middle red
;;  '(org-todo ((t (:foreground "#B020A0" :weight bold))))    ;; purple
;;  '(org-done ((t (:foreground "#008000" :strike-through t :weight bold)))) ;; bold dark green
;;  ;; <TODO: use "background-color" in "default-frame-alist" instead of hard coding it here>
;;  `(org-hide ((t (:foreground "white")))) ;; same as background
;;  '(org-table ((((class color) (min-colors 512)) (:foreground "#181880" :background "#98D0D8"))
;;               (t (:foreground "#181880"))))   ;; dark green blue
;;  '(org-drawer ((t (:foreground "#0040C0"))))  ;; dark green blue
;;  '(org-formula ((t (:foreground "#800000")))) ;; dark red
;;  '(org-time-grid ((t (:foreground "#B8860B")))) ;; dark golden rod
;;  ;; '(org-link ((((class color) (background light)) (:foreground "#A020F0" :underline t)))) ;; official purple
;;  ;; '(org-date ((((class color) (background light)) (:foreground "#A020F0" :underline t)))) ;; official purple
;;  '(org-link ((t (:foreground "#5050FF" :underline t)))) ;; light blue
;;  '(org-date ((t (:foreground "#5050FF" :underline t)))) ;; light blue
;;  '(org-tag ((t (:foreground "#008000" :weight bold))))
;;  '(org-code ((t (:foreground "#505050"))))            ;; gray
;;  '(org-special-keyword ((t (:foreground "#205060")))) ;; dark green blue
;;  '(org-column ((t (:background "gray80" :box (:line-width 1 :color "grey70")))))
;;  )

;; (defun my-org-mode-common-hook()
;;   (custom-set-faces
;;    '(font-lock-comment-face ((t (:strike-through t))))
;;    )
;; )

;; (add-hook 'org-mode-hook  'my-org-mode-common-hook)

;; (defface org-embedded-code-face
;;   '((t (:foreground "grey40")))
;;   "Used in org-mode to indicate code block.")

;; (font-lock-add-keywords
;;  'org-mode
;;  '(("#\\+BEGIN_SRC.*$" . 'org-embedded-code-face)
;;    ("#\\+END_SRC" . 'org-embedded-code-face)))
;; ------------------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; 모든 것들에 대해서 hl-line-mode 를 사용하는 것은 좋지만 아래 처럼 background 색을
;; 지정을 하면 다른 color theme 모드에서는 잘 안보이는 문제가 있다.
;; 알아서 잘 사용하자. 

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#333333")

;;set cursor colour
;; (set-cursor-color "yellow")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; useful short key ;;;;;;;;;;;;;;;;;;;;

;; C-x [   문서의 시작으로 이동 
;; C-x ]   문서의 끝으로 이동
;; C-/     undo
;; M-;     기본 주석
;; M-!     shell command
;; C-x h    전체 선택
;; cmd 에서 바로 전에 명령한 곳으로 가는 키는 C-c C-r


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; KEYBOARD MACRO TIP
;;

;;http://emacs-fu.blogspot.com/2010/07/keyboard-macros.html

;;;; Begin macro
;; C-x ( or F3

;;;; End macro
;; C-x ) or F4

;;;; using macro

;;;; To execute the last defined macro 
;; C-X e
;;;; To repeat
;; just press e key or F4(kmacro=end-of-call-macro)


;;;; 123 times 
;; C-u 123 C-x e

;;; you can even repeat the macro until the end of the buffer
;; C-u 0 C-x e

;;;; in the selected area (region) 
;; M-x apply-macro-to-region-lines (or C-x C-k r). 


;;;; saving macros for later use
;; M-x name-last-kbd-macro (saving foo name)
;; just M-x foo

;; foo which will be available until you exit emacs.

;; you want to have the macro for future emacs sessions as well
;; you can use insert-kbd-macro
;; for example, this will look like
;;(fset 'lim
;;   [?\C-a ?\M-d delete delete ?\C-e ?  ?\C-y ?\C-n])

;; and .emacs key binding
;;(global-set-key (kbd "C-c f") 'lim)

;;; edit macro
;; M-x edit-kbd-macro M-x lim

;; please refer to the section Keyboard macros in the emacs manual (C-h r) for all the details.

;;; 전에 눌렀던 키 값을 보여준다.  
;; C-h l shows your last 300 key
;; presses ('lossage'). Interesting to see, and it might be useful
;; when defining keyboard macros.



;;M-27 x gives you xxxxxxxxxxxxxxxxxxxxxxxxxxx; and, believe it or
;;;;not, works also with different characters and numbers;

;;; M-q 를 하면 긴 라인을 정렬 시키는데 이것을 다시 원상 복수 시킬려면 C-u M-^ 을 하면 된다.

;;;; M-\

;;M-\ (delete-horizontal-space).
;; 한 라인에서 공백이 여러개 있어도 다 지워준다. C-d로 여러번 할 것을 한번에 할 수 있겠다.
;; 123       456789  before
;; 123456789  after

;;mark-whole-buffer and then indent-region
;; C-x h C-M-\


;;; 특수 문자 입력하기 
;; C-x 8 RET in a recent emacs version gives
;; you an auto-completable list of special characters to insert. So
;; if I need, say, the Yen-character, I type C-x 8 RET ye TAB and I
;; get YEN SIGN, which RET will then insert: ¥. Note that the
;; completion only works on the start of the character name, so if
;; you'd want to include the α-character, you'd need to know that
;; its UCS-name is GREEK SMALL LETTER ALPHA… (you can try *alpha or
;; TAB the empty string, and search in the results buffer, but
;; that's rather slow)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cua-mode setting
;; cua-mode's rectangle support also includes all the normal rectangle
;; functions with easy access:
;;
;;위쪽에 있는 라인과 아래쪽에 있는 라인의 칸수가 맞지 않을때 위족에 있는 라인과 아래쪽 라인을 같이 선택한 후에 M-a를 하면 left 쪽으로 서로 라인을
;;맞춘다. 서로 라인을 맞출 때 유용하다.
;; [M-a] aligns all words at the left edge of the rectangle
;; [M-b] fills the rectangle with blanks (tabs and spaces)
;; [M-c] closes the rectangle by removing all blanks at the left edge
;;       of the rectangle
;; [M-f] fills the rectangle with a single character (prompt)
;; [M-i] increases the first number found on each line of the rectangle
;;       by the amount given by the numeric prefix argument (default 1)
;;       It recognizes 0x... as hexadecimal numbers
;; [M-k] kills the rectangle as normal multi-line text (for paste)
;; [M-l] downcases the rectangle
;; [M-m] copies the rectangle as normal multi-line text (for paste)
;; 원하는 숫자부터 시작을 해서 자동으로 증가를 시킬 수 있다.
;; [M-n] fills each line of the rectangle with increasing numbers using
;;       a supplied format string (prompt)
;; [M-o] opens the rectangle by moving the highlighted text to the
;;       right of the rectangle and filling the rectangle with blanks.
;; [M-p] toggles virtual straight rectangle edges
;; [M-P] inserts tabs and spaces (padding) to make real straight edges
;; [M-q] performs text filling on the rectangle
;; [M-r] replaces REGEXP (prompt) by STRING (prompt) in rectangle
;; [M-R] reverse the lines in the rectangle
;; [M-s] fills each line of the rectangle with the same STRING (prompt)
;; [M-t] performs text fill of the rectangle with TEXT (prompt)
;; [M-u] upcases the rectangle
;; [M-|] runs shell command on rectangle
;; [M-'] restricts rectangle to lines with CHAR (prompt) at left column
;; [M-/] restricts rectangle to lines matching REGEXP (prompt)
;; [C-?] Shows a brief list of the above commands.

;; [M-C-up] and [M-C-down] scrolls the lines INSIDE the rectangle up
;; and down; lines scrolled outside the top or bottom of the rectangle
;; are lost, but can be recovered using [C-z].


;; C-Return Cua Select Mode 이다. 일반 적인것은 C-Space이지만 Cua 쪽은 C-Return이다.

( setq cua-enable-cua-keys nil) ;; only for rectangles
;;(setq cua-highlight-region-shift-only t) ;; no transient mark mode
;;(setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
;; (cua-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; 영역을 잡고 tab 넣는것은, 전 이렇게 합니다. 
;; 블럭잡고 C-x r t 누르면 밑에 입력부분이 활성화 됩니다. 
;; 거기에 넣고 싶은 문자열을 넣으면 블럭잡은 앞부분에 
;; 그 문자열이 추가됩니다. 탭도 되고, 스페이스도 되고요. 
;; 저같은 경우는 한번에 주석 늘때 자주 사용합니다.


; Make man pages appear in current window
;; (if (boundp 'Man-notify)
;;     Man-notify 'bully)


;;C-u C-x = : 현재 출력되고 있는 font 종류 표시


;; (if (functionp 'glohbal-hi-lock-mode) ; C-x w h 등으로 특정 단어들을 빛내준다
;;     (global-hi-lock-mode 1)
;;   (hi-lock-mode 1))

;; (set-face-background 'hl-line "#222")
;; (set-face-foreground 'highlight nil) 
;; (set-face-foreground 'hl-line nil)

;; 단어 highlight
;; C-x w h
 
;; highlight 단어 빼기
;; C-x w r

;; hl-lock-mode 가 제공하는 기능으로, 그중 자주쓰는 것이 위의 두가지. 
;; vim 에서는 단어위에서 % 를 누르는것만으로 가능했는데, 
;; 키바인딩이 다소 복잡하다. 자주 쓰게 된다면 좀 편한 함수, 
;; hi-word-at-point 등을 만들어서 쓰자.



;;아래 코드를 넣으면 emacs에서 compile작업시 자동으로 인식해서 명령을 내려준다.
;;emacs에서의 자체 varialbles가 있다.
 
;; example 1
;; 간단히 소스아래부분에 이걸 넣에주면 따로 컴파일 명령어를 하지 않아도
;; 아래에 있는 compile-command명령이 주어진다.
;;/*
;; * Local variables:
;; * compile-command: "gcc -Wall -O2 `xine-config --cflags` `xine-config --libs` -I/usr/X11R6/include -L/usr/X11R6/lib -lX11 -lm -o muxine muxine.c"
;; * End:
;; */
 

;; example 2
;; Local Variables: **
;; mode:lisp **
;; comment-column:0 **
;; comment-start: ";; "  **
;; comment-end:"**" **
;; End: **



;; 쿼리 실행용 버퍼 띄우기
 
;; http://jfulton.org/?page=Software&file=emacs.php
 
;;    1. M-x sql-mysql
;;    2. You will then be prompted for the User:, Password:, Server:, and Database: in the mini-buffer
;;    3. 다음의 단축키로 작성한 쿼리를 실행시킬 수 있다.
 
;;     *  C-c C-b: sql-send-buffer
;;     * C-c C-r: sql-send-region
;;     * C-c C-c: sql-send-paragraph

;; (sql-help)
 
;; PostGres: M-x sql-postgres
;; MySQL: M-x sql-mysql
;; SQLite: M-x sql-sqlite



;;;;;;;;  공백 문자 제거를 할려면
;;;;;;;;                        ddddd
;;;;;;;;  M-Space
;;;;;;;; ddddd
;;;;;;;; 이렇게 된다 OK? 잘 모르면 직접 해봐
;;;;;;;; M은 ESC 로 한다.


;;;; Regular Expression Search
;; C-M-s Begin incremental regexp search
;; C-M-r Begin reverse incremental regexp search 






(provide 'emacs-tips)
;;; emacs-tips.el ends here
