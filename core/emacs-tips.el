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



;; (autoload 'function "filename")
;; 함수와 함수를 구현한 패키지를 연결하여 함수가 처음으로 실행될 때 패키지로부터 코드를 읽어들일 수 있도록 한다.

;; copyright 삽입
;; M-x copyright
;; copyright 삽입
;; M-x copyright-update
;; copyright update 현재 연도 추가



;; 정규식 도우미

;;  M-x re-builder
;; 으.. 없는게 없다. vim 과 정규식이 너무 달라서 혼동스러운데, 이걸 찾아서 다행이다.
;; 정규식을 어떻게 할지 도와준다.. 일단 실행해 보면 안다.


;;;;; 정규표현식으로 찾는 표현식 가운데 
;; M-x re-builder가 있고 M-x isearch-forward-regexp가 있다.
;; 두개가 다 좋은 방식이다. 바로 하고 싶으면 
;; C-M-s 가 isearch-forward-regexp이다.



;; occur buffer
 
;; M-x occur
;; M-x grep 과 유사한데, 파일 대상이 아니고 현재 버퍼를 대상으로 한다. 
;; vim 에서는 이런걸 써본적이 없는데.. 알아두면 쓸곳이 있을것 같아서 적어둔다. 
;; 여러가지로 응용할수가 있는데, http://www.emacswiki.org/cgi-bin/wiki/OccurBuffer 를 봐두자.


;; 현재 포인트(커서) 아래의 정보 보기
;; C-x =
;; what-cursor-position 




;; 이전 수정하던 곳으로 돌아가기
;; C-u C-SPC
;; 이전 set-mark 위치로 pop 하기
;; 이건 일종의 편법(?)인데... C-SPC 는 region 을 잡기 위한 명령이지만 
;; C-u prefix 를 넣어주면 바로 이전에 set-mark 가 된곳으로 돌아가게 된다. 
;; 이 set-mark 는 스택구조로.. C-u C-SPC 를 할때마다 pop 된다.



;;; cwarn-mode는 Emacs로 C/C++ 프로그램을 작성할 때, 
;;; 에러가 의심되는 부분을 강조해서 보여주는 기능을 하는 minor mode입니다.
;;; 여기서 에러가 의심되는 부분이란, 조건식 내에 ==가 아니라 =가 쓰인 경우 등을 이야기합니다.
;;; M-x cwarn-mode
;;; .emacs 파일에 다음 내용을 추가하면 이 기능이 기본적으로 활성화됩니다.
 
;; (global-cwarn-mode t)


;;; 이맥스에는 show-trailing-whitespace라는 변수가 존재합니다.
;;; 일반적으로 공백은 눈에 보이지 않기 때문에, 줄 끝에 공백이 있는지 
;;; 확인하기 어렵지만, 이 변수에 nil이 아닌 값을 설정하면, 
;;; 줄 끝에 나타나는 공백을 눈으로 볼 수 있습니다.
 
;;; 이맥스 설정 파일인 .emacs 파일에 다음 내용을 추가하여, 
;;; 이 기능을 기본적으로 활성화시킬 수도 있습니다. (추천 안함)
 
;;; (setq-default show-trailing-whitespace t)
 
;;; 그리고 줄 끝에 나타나는 이러한 공백들은 
;;; delete-trailing-whitespace 명령으로 한꺼번에 제거할 수 있습니다.
 
;;; M-x delete-trailing-whitespace

;;;;;;; FlyMake Mode;;;;;;;;;;;;
 
;; 일단 Makefile을 만들어서 check-syntax라는 구문을 만든다.
;;;; Makefile
;; -------------------------------------------
;; # flaymake requires the following target
;;
;; check-syntax:
;;  gcc -o nul -Wall -S $(CHK_SOURCES)
;;
;; # Don't misspell
;;
;; sample:
;;  gcc -o sample sample.c
;;--------------------------------------------
;; sample.c라는 파일에서 flymake-mode를 설정하고
;; 코딩을 하면 실시간으로 warning이나
;; error을 알려준다.


(defun flymake-compile()
    "kill all flymake syntax checks, start compilation"
    (interactive)
    (flymake-stop-all-syntax-checks)
    (call-interactively 'compile))


;;; tramp mode

;; tramp 이용한 sudo 사용법 
;; /sudo::/etc/php5/


;; (require 'tramp)
;; ;;(add-to-list 'load-path "~/.emacs.d/tramp-2.1.9/lisp")
;; (setq tramp-debug-buffer t)
;; (setq tramp-verbose 10)
;; (setq find-file-visit-truename nil)
;; (setq tramp-default-method "sshx")
;; (setq tramp-default-method "plink")

;; (require 'tramp)
;; (setq tramp-chunksize 500)
;; (setq tramp-password-end-of-line "\r\n")
;; (setq tramp-remote-sh "/bin/bash")
;; (setq exec-path (append exec-path '("e:/utils/putty/"))
;;       ssh-program "plink"
;;       tramp-completion-without-shell-p t
;;   tramp-debug-buffer t
;;   tramp-verbose 10
;; )

;;; su ---> ssh connect-
;;; tm ---> telnet connect
 
;;Quick-Start Tramp Configuration
;;(setq tramp-default-method "ssh")
;;For GNU Emacs
;;C-x C-f /remotehost:filename  RET (or /method:user@remotehost:filename)
;; using su or sudo
;;C-x C-f /su::/etc/hosts RET
;;C-x C-f /sudo::/etc/hosts RET

;; when u delete files and directory
;; moving to trash
;; (setq delete-by-moving-to-trash t)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs some tips
;;
;;
;;replace <1> -> (1), <2> -> (2), <3> -> (3) usw.
;;query-replace-regexp <\(.\)> (\1)
;;$ gnudoit '(message "Hello from Cygwin")'
;;C:\>gnudoit "(message \"Hello from NT\")"
;;
;;
;; M-x how-many 
;; \b\w 
;; returns a word count from point to the end of the buffer.
 

;;(setenv "X" "/[scp@user@host]")
;;C-x C-f $X/path/to/file RET.
 

;; =============== C 언어 도움될만한 키 바인딩 ====================
 
;; C-c C-p         c-backward-conditional
;; C-c C-n         c-forward-conditional
 
;; #if 0
;;  something....
;; #endif
 
;; 위에 처럼 되어 있을때 #if 0과의 짝인 #endif를 찾아 준다 자세한건
;; 직접 해보면 느끼지요..
 
 
 
;; 선택된 영역을 \ 표시로 해준다.
;; 쓸일이 언제일지는 모르지만 알아두면 좋을것 같다.
 
;; C-c C-\         c-backslash-region
 

;; 커서가 위치해 있는 해당 함수만을 자동으로 선택되어진다.
;; 알아두면 좋다.
 
;; ESC C-h         c-mark-function
 
;; 특별히 C에서 국한된것이 아닌 범용적인 키 바인딩이다.
;; 이걸 알아두면 함수의 처음과 끝을 자유로이 왔다리 갔다리...
 
;; C-M-a runs the command beginning-of-defun
;; C-M-e runs the command end-of-defun
 

;; Using tags in emacs on windows
;; 1. find . -regex ".*\(h$\|cpp$\)" > files.txt
;; 2. etags.exe - < files.txt
;; 3. M-x visit-tags-table
 

;;; 대문자 소문자
 
;; 대문자
;;upcase-word M-u
;;upcase-region C-x C-u
 
;; 앞자만 대문자
;; capitalize-word  M-c
;; capitalize-region
 
;; 소문자
;; downcase-word M-l
;; downcase-region C-x C-l
 

;;; removing 
 ;; (C-q C-m) ^M (for search)
;;; M-x replace-string or query-replace
;;; C-q C-m equals to ^M (not ^ + M )
;;; so just M-x replace-string 
 ;; RET RET that's it
 
;;; equal to  
 
 
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; indent가 tab 으로 되어 있는 문서를 space 로 바꾸는 방법
;; M-x untabify





;; 아래 처럼 해서 파일의 최신 버전의 시간을 계속 stamp 하는 것도 괜찮은 방법이다.
;;; -*- coding: utf-8 -*-
;#####################################################################################
; Time-stamp: <2016-10-12 15:48:29 yhlim>
;#####################################################################################
;;----------------------- time stamp start ------------------------------------
;; Add Time-stamp <> or Time-stamp " " anywhere in the top 8 lines of a
;; file to insert save date and time and user:
;; look like one of the following:
;;       Time-stamp: <>
;;       Time-stamp: " "
 
;; 파일의 time stamp를 알아서 찍어준다 
;; 파일의 갱신 날짜를 알고 싶을때 쓰면 유용하다.
;; 형식은 맨위의 줄 8줄 내에 위와 같은 형식으로만 
;; 되어 있다면 자동으로 포맷에 맞는 날짜와 사용자를 써 넣는다.
 
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-active t)
;;(setq time-stamp-format "%02d-%3b-%:y %02H:%02M:%02S %u")
;;----------------------- time stamp end --------------------------------------


;; Make the sequence "C-x w" execute the `what-line' command,
;; which prints the current line number in the echo area.
(global-set-key "\C-xw" 'what-line)


(setq default-major-mode 'indented-text-mode)
;; auto-fill 에 설정되어 있으면 문장이 길어지면 자동으로 다음 줄로 넘어간다. 극혐이다.
;;(toggle-text-mode-auto-fill)            ; always auto-fill in text mode,
(auto-fill-mode -1)

;; for org tags test
;; 자주 사용하는 태그를 미리 저장해 놓고 쓰면
;; 편하다. 방법은 두가지가 있다.
;; 1.
;; (setq org-tag-alist '(("URGENT" . ?u)
;;                       ("@PHONE" . ?p)
;;                       ("@ERRANDS" . ?e)))
;; 2.
;; org 파일 처음 시작 부분에 아래처럼 작성한다.
;; #+TAGS: URGENT(u) @PHONE(p) @ERRANDS(e)

;;위의 두 가지 방법이 중복되서 실행은 되지 않는다.
;;즉 1번 설정을 놓고 org file 처음에
;; #+TAGS: TEST(t)
;;라고 설정을 하면 총 네가지가 미리 나와야 하는데
;; 그렇게 나오지를 않는다.
;; 상황에 맞게 알아서 사용해야겠다.


;;Quick-Start Tramp Configuration
;;(setq tramp-default-method "ssh")

;;For GNU Emacs
;;C-x C-f /remotehost:filename  RET (or /method:user@remotehost:filename)

;; using su or sudo
;;C-x C-f /su::/etc/hosts RET
;;C-x C-f /sudo::/etc/hosts RET




;; 한글 입려할때 아래 미니버퍼 부분에 한글에 초성 중성 종성으로 나뉘어서
;; 표시가되는데 상당히 거슬린다 없애버리자!!!!
;; (setq input-method-verbose-flag nil)



;; Allow access to system clipboard.
;; This is supposed to be a default but for
;; some reasons, it do not work for me..
;; So I put this...
;; (setq x-select-enable-clipboard t)




;; Make the sequence "C-x w" execute the `what-line' command, 
;; which prints the current line number in the echo area.
;; (global-set-key "\C-xw" 'what-line)



;; ************************************************************
;;               T I P    &   T R I C K S
;; ************************************************************

;; use registers
;; To copy to named register: C-x r s a - Where a is the name of the
;; register ( a - z ) to save the text to.

;; To paste from named register: C-x r i a - Where a is the name of
;; the register ( a - z ) to paste the saved text from.

;; To remember current point: C-x r spc a - Where a is the name of the
;; register to save point to.
;; To jump to named point: C-x r j a - Where a is the name of the
;; register holding desired point to jump to
;; =====================================================================
;; =====================================================================




;;; 파일을 dos to unix 를 할려면 set-buffer-file-coding-system을 이용하면 된다.

;; find . -name "*.c" -exec perl -pi -e 's/\r//g' {}\;
;; perl -pi -e "s/\r//g" *
;; find / -name "*.txt" -exec perl -pi -e 's/찾을문자열/바꿀문자열/g' {} 
;; sed -e "s/^M//g" dos.file > unix.file


;;tip
;; 영역을 잡고 tab 넣는것은, 전 이렇게 합니다. 
;; 블럭잡고 C-x r t 누르면 밑에 입력부분이 활성화 됩니다. 
;; 거기에 넣고 싶은 문자열을 넣으면 블럭잡은 앞부분에 
;; 그 문자열이 추가됩니다. 탭도 되고, 스페이스도 되고요. 
;; 저같은 경우는 한번에 주석 늘때 자주 사용합니다.




;:* Use a sexy background pixmap.
;;(set-face-background-pixmap 'default
;;[png :file "~/.xemacs/xemacs_bg.png"])
;;[jpeg :file "~/down/Tiger.jpg"])

;;(set-face-background-pixmap 'default
;;[png :file "~/.xemacs/xemacs_bg.png"])
;;[jpeg :file "~/emacs_settings/eunseo.jpg"])


; Make man pages appear in current window
;; (if (boundp 'Man-notify)
;;     Man-notify 'bully)


;; tip
;;C-u C-x = : 현재 출력되고 있는 font 종류 표시




;;; 클릭해야 focus가 이동할 때
;;(setq focus-follows-mouse nil)

;: Set background-mode to dark (why isn't this autodetected?)
;;(setq frame-background-mode 'dark)



;; (defun select-frame-set-input-focus (frame)
;;   "Select FRAME, raise it, and set input focus, if possible."
;;   (select-frame frame)
;;   (raise-frame frame)
;;   ;; Ensure, if possible, that frame gets input focus.
;;   (cond ((eq window-system 'x) (x-focus-frame frame))
;;         ((eq window-system 'w32) (w32-focus-frame frame)))
;;   (cond (focus-follows-mouse
;;          (set-mouse-position (selected-frame)
;;                              (1- (frame-width)) 0))))

;; (custom-set-faces '(default ((t (:stipple nil :background ((image
;;  :type jpeg :file "~/down/Tiger.png") :origin display) :foreground
;;  "white" :inverse-video nil :box nil :strike-through nil :overline
;;  nil :underline nil :slant normal :weight normal :height 101 :width
;;  normal :family "misc-fixed")))))

;; (defconst win32p  (eq system-type 'windows-nt) "윈도머신이면 참")
;; (defconst unixp   (eq system-type (or 'gnu/linux 'berkeley-unix)) "FreeBSD 머신이면 참")
;; (defconst homep   (string-match "BADMAN" system-name)"집의 pc 라면 참")
;; (defconst officep (string-match "PYTHON" system-name)"사무실의 pc 라면 참")



(if (functionp 'global-hi-lock-mode) ; C-x w h 등으로 특정 단어들을 빛내준다
    (global-hi-lock-mode 1)
  (hi-lock-mode 1))
;;(global-hl-line-mode 1)                 ; 현재줄을 빛내준다


;; 단어 highlight
;; C-x w h

;; highlight 단어 빼기
;; C-x w r


;; hl-lock-mode 가 제공하는 기능으로, 그중 자주쓰는 것이 위의 두가지. 
;; vim 에서는 단어위에서 % 를 누르는것만으로 가능했는데, 
;; 키바인딩이 다소 복잡하다. 자주 쓰게 된다면 좀 편한 함수, 
;; hi-word-at-point 등을 만들어서 쓰자.
;; 현재 내가 쓰는 cvs emacs 는 이전 stable 때의 hi-lock-mode 와 약간 다르게 도는 버그가 있다.


;;;; 윈도에서는 윈도키를 잘 써먹자
;; (when win32p
;;   (setq w32-pass-lwindow-to-system nil
;;         w32-pass-rwindow-to-system nil
;;         w32-pass-apps-to-system    nil
;;         w32-lwindow-modifier       'super   ;; Left Windows
;;         w32-rwindow-modifier       'super   ;; Rigth Windows
;;         w32-apps-modifier          'hyper) ;; App-Menu (right to Right Windows)
;;   (global-set-key [(super g)] 'goto-line))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; word-at-point 로 영어사전 검색
;; 햐.. 몇줄안되지만 elisp 처음 써보는거라 힘들었다.
;; thingatpt 의 word-at-point ( thing-at-point 의 alias ) 의 존재를 모르고
;; word-at-point 를 만들어 볼려고 고생했었는데.. thingatpt 의 존재를 알게되서 다행이다
;; 키바인딩을 해야 하는데.. 뭘로 할까? vim 이면 <Leader>dic 정도로 했을텐데..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'thingatpt)
;; (setq yoonkn/dic-dicurl "http://kr.engdic.yahoo.com/search/engdic?p=%s")
;; (defun yoonkn/dic-at-point ()
;;   (interactive)
;;   (browse-url (format yoonkn/dic-dicurl (word-at-point))))
;; (global-set-key "\C-cdic" 'yoonkn/dic-at-point)




;; change logs 작성 팁
;; C-x 4 a 로 ChangeLog 에 새로운 항목을 추가할수 있다.
;; (add-change-log-entry-other-window) 즉 어떤 파일을 수정하고 C-x 4 a 로 
;; change log 를 작성하게 되면 해당 디렉토리 내에 ChangeLog 라는 
;; 파일이 생성(또는 내용이 추가)되며, 누가, 어떤 파일을 고쳤는지 기록할수 있게 해준다.




;; C, Cpp 모드 팁

;; 전처리기 적용해보기
;; 블럭잡고 C-c C-e 를 해보면 전처리가 적용된 후의 코드들을 볼수있다. 간단히 #include 등에 블럭을 잡고 눌러보자

;; 함수 하나 블럭 잡기
;; C-M-h 를 누르면 현재 커서가 포함된 함수전체를 블럭으로 잡아준다. copy-paste 작업을 할때 굳~






;; 위 의 내용은 function 을 적은 것이기 때문에 .emacs 
;; 편집 화면 내에서 C-x C-e 를 누르시면 reload-dotemacs 
;; 라는 이름의 function 이 실시간으로 등록됩니다. 
;; 이제 M-x reload-dotemacs 라고 하면 짜자잔~

;; wisembed settop의 mips칩 빌드를 위한 env 셋팅
;;/////////////////////////////////////////////////////////////////
;; (setq load-path (cons (expand-file-name "/usr/share/emacs/23.0.0/site-lisp/") load-path))
;;(setq exec-path (cons "C:/MinGW/bin" exec-path))
;(setenv "PATH" (concat "C:\\MinGW\\bin;" (getenv "PATH")))
(setq exec-path (cons "/home/user/8634/toolchain/build_mipsel/staging_dir/usr/bin:/home/user/8634/toolchain/build_mipsel/staging_dir/bin:" exec-path))
(setenv "PATH" (concat "/home/user/8634/toolchain/build_mipsel/staging_dir/usr/bin:/home/user/8634/toolchain/build_mipsel/staging_dir/bin:" (getenv "PATH")))
(setenv "CCACHE_DIR")
;;/////////////////////////////////////////////////////////////////


;; 컴파일 창을 높인다.
;;(setq compilation-window-height 8)


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

;;위에처럼 M-x sql-help를 하면 아래쪽 처럼 각 DB별로 help가 나온다.

;; (sql-help)

;; PostGres: M-x sql-postgres
;; MySQL: M-x sql-mysql
;; SQLite: M-x sql-sqlite




;;; Emacs의 longlines-mode는 긴 줄이 포함된 텍스트를 쉽게 편집할 수 있도록 도와주는 minor mode입니다.
;;; M-x longlines-mode <RET>
;;; longlines-mode에서는 fill-column 값을 넘어가는 긴 줄은 자동으로 줄 바꿈이 되며, 실제 라인 단위가 
;;; 아니라 화면에 보이는 라인 단위로 이동하는 것이 가능해집니다.
;;; 따라서, 프로그램 소스 코드가 아닌 일반 텍스트 문서를 작성할 때 아주 유용합니다.
;;; 만약, longlines-mode에서 실제 라인과 화면에 보이는 라인이 구분이 어렵다면, 
;;; longlines-show-hard-newlines 변수를 nil이 아닌 값으로 설정하면 됩니다.
;;; M-x set-variable <RET> longlines-show-hard-newlines <RET> t <RET>


;;; 위의 longlines-mode보다 더 괜찮은 것을 찾았다.
;;; vim에서의 gj, gk 기능을 emacs에서도 써보자!
;;; 아래 url에서 download
;;; http://homepage1.nifty.com/bmonkey/emacs/elisp/screen-lines.el




;;; shell상에서 ls치면 이상하게 표현되는 현상은 아직 해결 못하고 있다.
;;; 아래와 갈이 요상한 문자로 나온다.
;;; user@user-desktop:~$ ls
;;; [0m[0m#.emacs#[0m                     [01;34memacs_install[0m            [01;34mtorrent[0m
;;; [0m#emacs-registers#[0m            [0mfontlist[0m                 [0mtrac.back[0m
;;; [01;34m8634[0m                         [0mnext-screen-line.el[0m      [01;34mworkspace[0m
;;; [01;36mExamples[0m                     [0msemantic.cache[0m           [01;34m공개[0m
;;; [0mFirefox_wallpaper.png[0m        [01;34msharp[0m                    [01;34m문서[0m
;;; [0m[병완] Like a dophine..html[0m  [0mssl.back[0m                 [01;34m바탕화면[0m
;;; [01;34mdown[0m                         [0mtelepix.crt[0m              [01;34m비디오[0m
;;; [0memacs-registers[0m              [0mtelepix.key[0m              [01;34m사진[0m
;;; [0memacs-registers~[0m             [0mtelepix.key.for.apache2[0m  [01;34m음악[0m
;;; [0memacs.tar.gz[0m                 [0mtest.c[0m                   [01;34m템플릿[0m

;;; 위의 현상은 color표시를 잘 해주지 못해서 나타나는 현상이다.
;;; 참고 페이지는 아래와 같다.
;;; http://www.emacswiki.org/cgi-bin/wiki?AnsiColor

;;; 아래 설정만 해 주면 제대로 동작을 한다.

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; 옛날 버전의 emacs는 아래 파일을 다운 받아서 위에 처렁 설정해 주면 된다. 
;;; http://www.emacswiki.org/cgi-bin/wiki/download/ansi-color.el


;;; 이맥스에는 show-trailing-whitespace라는 변수가 존재합니다.
;;; 일반적으로 공백은 눈에 보이지 않기 때문에, 줄 끝에 공백이 있는지 
;;; 확인하기 어렵지만, 이 변수에 nil이 아닌 값을 설정하면, 
;;; 줄 끝에 나타나는 공백을 눈으로 볼 수 있습니다.

;;; 이맥스 설정 파일인 .emacs 파일에 다음 내용을 추가하여, 
;;; 이 기능을 기본적으로 활성화시킬 수도 있습니다. (추천 안함)

;;; (setq-default show-trailing-whitespace t)

;;; 그리고 줄 끝에 나타나는 이러한 공백들은 
;;; delete-trailing-whitespace 명령으로 한꺼번에 제거할 수 있습니다.

;;; M-x delete-trailing-whitespace





;;;원하는 헤더 화일에 관해서 들어있는 패키지가 뭔지 알아 볼려면 아래처럼 한다.
;; apt-cache show build-essential | grep Depends 
;; Depends: libc6-dev | libc-dev, gcc (>= 4:4.1.1), g++ (>= 4:4.1.1), make, dpkg-dev (>= 1.13.5) 

;; dpkg -S /usr/include/stdio.h                  
;; libc6-dev: /usr/include/stdio.h 

;;; yum은 yum provides stdio.h 라고 한다.




  
;;;;;; mysql


(defvar my-databases nil "A list of database names used by my-update-database.")
(setq my-databases '("square_training"))

;; Sends the current file to a chosen database
(defun my-update-database ()
  "Sends the current file to a chosen database."
  (interactive)
  (if (not my-sql-profile)
      (my-sql-set-profile))
  (let ((db_name (let ((completion-ignore-case t))
                   (ido-completing-read "Database: " my-databases))))
    (if (not (member db_name my-databases))
        (push db_name my-databases))
    (if buffer-file-name
        (progn
          (shell-command (concat "mysql " db_name " --host=" sql-server
                                 " --user=" sql-user " --password=" sql-password
                                 " < " buffer-file-name)))
    (message "No file associated with buffer."))))

(add-hook 'sql-mode-hook (lambda () (local-set-key (kbd "C-c C-b") 'my-update-database)))

;; The current mysql profile
(defvar my-sql-profile nil)

;; Links mysql profile names to sql-mode variables
(defvar my-sql-vars '(("localhost" . ("username" "password" "host"))
                      ("otherhost" . ("username" "password" "host"))))

(defun my-sql-mysql (change)
  (interactive "P")
  (my-sql-set-profile change)
  (sql-mysql))

;; Runs sql-mysql. When called with a prefix argument (or on first run) it
;; prompts for the sql profile to select.
(defun my-sql-set-profile (&optional change)
  "Sets up the sql-mode variables and then runs sql-mysql."
  (if (or (not my-sql-profile) change)
      (let ((completion-ignore-case t)
            (completion-function 'ido-completing-read))
        (let ((choice (funcall completion-function "SQL Profile: " my-sql-vars)))
          (dolist (profile my-sql-vars)
            (let ((profile-name (car profile))
                  (profile-vars (cdr profile)))
              (if (string-match profile-name choice)
                  (setq sql-user (nth 0 profile-vars)
                        sql-password (nth 1 profile-vars)
                        sql-server (nth 2 profile-vars)
                        my-sql-profile profile-name))))))))




;; valgrind options
;; valgrind --workaround-gcc296-bugs=yes --tool=memcheck --leak-check=full --show-reachable=yes -v ./ssplayer ~/movies/koma500k.avi 
;; valgrind  --tool=memcheck --leak-check=full --show-reachable=yes -v ./acqsvsvr




;;; validation check
;;; xmllint --valid test.xml
;;; xmllint --htmlout --valid test.xml


;;; textmate에 있는 내용이다. 나중에 참고해 보자.
;; xmllint --htmlout --valid - 2>&1|perl -pe
;; 's|^((?:</?[^>]+>)*)(.*?):(\d+):(.*error.*)|$1<a
;; href="txmt://open?line=$3">$4</a>|'




;; To use resize-minibuffer-mode, uncomment this and include in your .emacs:
;;(resize-minibuffer-mode)






;; use carbon emacs on mac osx
;; transparency windows
(defun opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
;;          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
          (newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))



;;  아래를 C-x C-e 로 실행을 하면 alpha 값이 적용은 된다.
;; (modify-frame-parameters nil `((alpha . 90)))


;;; 알파값 설정이라는데 동작하지 않는다.
;;; carbon emacs를 사용하면 맥에서는 동작을 한다.
;;; 위의 함수를 사용하면 어떤 플랫폼에서도 동작을 하게 할 수 있다.
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(set-frame-parameter (selected-frame) 'alpha '(60 50))



;; 여러 파일 문자열 치환하기

;; M-x find-grep-dired 로 directory 선택
;; *Find* 버퍼에 파일 목록이 나열되면 t를 눌러 해달 파일 toggle
;; Q를 눌러 dired-do-query-replace를 실행
;; 원하는 문자열을 변경한다.


;; M-x customize-group RET dictionary RET 를 입력해서 설정을 바꿔줄
;; 수도 있습니다.



;;;; 문자 인코딩 변환하기
;;;; C-x C-m r 은 현재 파일을 설정한 인코딩으로 변환을 하는 것이다.
;;;; C-x RET f 은 현재 파일을 설정한 인코딩으로 변환하는게 아니라 바로 저장을 해 버린다.




;;;; 위의 설정을 해 놓고 svn을 사용하는 상황에서 windows나 linux는 별문제 없지만
;;;; 맥에서는 아래와 같은 메시지와 함께 commit같은걸 하면 작동을 안한다.
;; svn: Commit failed (details follow):
;; svn: Can't convert string from native encoding to 'UTF-8':

;; 아래 설정을 하면 왜 인지는 모르지만 잘 돌아간다.
;;  맥 에서 svn하고 emacs하고 잘 안돌아  가면
;; 아래 설정을 해 준다.
;; .profile 에 다음과 같이 추가해 줍니다.
;; export LC_CTYPE=en_US.UTF-8
;; export LANG=en_US.UTF-8







;; emacs 사전 설정
;; dictionary added
;; (add-to-list 'load-path
;;                    "~/.emacs.d/dictionary-1.8.7")

;; (load "dictionary-init")

;; ;; dictionary key bindings
;; (global-set-key "\C-cs" 'dictionary-search)
;; (global-set-key "\C-cm" 'dictionary-match-words)

;; M-x customize-group RET dictionary RET 를 입력해서 설정을 바꿔줄
;; 수도 있습니다.





;; carbon emacs에는 기본적으로 포함되어 있기 때문에 설정할 필요가
;; 없다. 다만 최신 버전을 사용할려고 한다면 한번 고려해 보자.
;; for using svn
;;(require 'psvn)
;; (setq process-coding-system-alist '(("svn" utf-8)))
;;(setq default file--name-coding-system ' utf-8)

;;;; 문자 인코딩 변환하기
;;;; C-x C-m r 은 현재 파일을 설정한 인코딩으로 변환을 하는 것이다.
;;;; C-x RET f 은 현재 파일을 설정한 인코딩으로 변환하는게 아니라 바로 저장을 해 버린다.



;; emacs_for_mac2의 gmail 부터 보면 됨








(provide 'emacs-tips)
;;; emacs-tips.el ends here
