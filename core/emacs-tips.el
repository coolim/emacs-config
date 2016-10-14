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


(provide 'emacs-tips)
;;; emacs-tips.el ends here
