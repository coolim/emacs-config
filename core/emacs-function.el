;;; emacs-function.el --- emacs-function configuration
;;; Copyright (C) 2016 by KudzuValley

;;************************************************************
;;               F U N C T I O N S
;;************************************************************
;; lisp 함수들을 정의한다.


;;;; lisp file 을 만들었을 때 기본 설명과 provide 를 자동 생성하게 만들었다.
(defun file-comment ()
  "lisp 파일을 만들고 file comment 를 단다."
  (interactive)
  (beginning-of-buffer)
  (insert (format ";;; %s" (file-name-nondirectory buffer-file-name))) ;; 현재 파일 이름만 가져온다.
  (insert (format " --- %s configuration\n" (file-name-base buffer-file-name)))
  (insert ";;; Copyright (C) 2016 by KudzuValley")
  (insert (format "\n\n\n\n\n(provide '%s)\n" (file-name-base buffer-file-name)))
  (insert (format ";;; %s ends here" (file-name-nondirectory buffer-file-name))))



;; We must make our own function to go to the previous window (but it's simple):
(defun other-window-backward ()
 "Select the previous window."
 (interactive)
 (other-window -1))


;; ================================================================================
;; Backbox 에서 파일탐색기인 thunar 를 호출한다.
;; ================================================================================

(defun dired-open-thunar ()
  (interactive)
  (call-process "thunar" nil 0 nil (dired-current-directory)))



;; ================================================================================
;; MINT 에서 파일탐색기인 nemo 를 호출한다.
;; ================================================================================
(defun dired-open-nemo ()
  (interactive)
  (call-process "nemo" nil 0 nil (dired-current-directory)))



;; ================================================================================
;; UBUNTU 에서 파일탐색기인 nautilus 를 호출한다.
;; ================================================================================
(defun dired-open-nautilus ()
  (interactive)
  (call-process "nautilus" nil 0 nil (dired-current-directory)))



;; %H is the hour on a 24-hour clock, %I is on a 12-hour clock, %k is like %H
;;  only blank-padded, %l is like %I blank-padded.
;; %p is the locale's equivalent of either AM or PM.
;; %M is the minute.
;; %S is the second.
;; %Z is the time zone name, %z is the numeric form.
;; %s is the number of seconds since 1970-01-01 00:00:00 +0000.

(defun insert-date ()
  "Insert current date
Point and markers are relocated as in the function `insert'."
  (interactive)
;;  (insert (format-time-string "%p %I:%M %Y-%m-%d" (current-time))))
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))))


;;;; 무조건 주석을 // 으로 하지 말고 언어에 따라서 주석을 달리 하는 함수를 만들어 보자.
;;;; makefile 같은 경우나 script 는 // 주석을 사용하지 않기 때문에 번거로움이 있었다. 

(defun insert-code-modify-Begin ()
  "modify code date"
  (interactive)
  (newline)  
  (insert "//LYH ")
  (insert-date)  
  (insert " Begin ")
  (newline)
  (insert "// {")
)

(defun insert-code-modify-End ()
  "modify code date"
  (interactive)
  (insert "// }")
  (newline)
  (insert "//LYH ")
  (insert-date)  
  (insert " End ")
)

(defun insert-code-modify-Full()
  "modify code date full"
  (interactive)
  (insert-code-modify-Begin)
  (newline)
  (newline)
  (insert-code-modify-End)
  (previous-line)
  (previous-line)
  (beginning-of-line)
  )

(defun my-named-shell ()
  "Equivalent to C-u M-x shell RET"
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'shell)))

(defun match-paren ()
  "% command of vi"
  (interactive)
  (let ((char (char-after (point))))
    (cond ((memq char '(?\( ?\{ ?\[))
	   (forward-sexp 1)
	   (backward-char 1))
	  ((memq char '(?\) ?\} ?\]))
	   (forward-char 1)
	   (backward-sexp 1))
	  (t (call-interactively 'self-insert-command)))))

(defun copy-to-buffer-filename ()
  "현재 버퍼의 패스 및 파일 이름을 복사한다."
  (interactive)
  (kill-new (buffer-file-name))
  )


(defun function-start-end ()
 "자동으로 { }을 표시해 준다 함수 작성할때 귀찮다.
  move-end-of-line이란 함수는 동작을 안하는데 아직 모르겠다.
  end-of_line은 동작을 한다. 함수 어느곳에서도 사용 가능해 졌다.
 "
 (interactive)
 (end-of-line)
 (newline)
 (insert "{")
 (c-indent-command)
 (newline)
 (newline)
 (insert "}")
 (c-indent-command)
 (previous-line)
 (c-indent-command)
 )


(defun stane-compile-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  ;;(setq compile-command "make -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_Stane1983;make apk -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_Stane1983")
  (setq compile-command "make -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_Stane1983")
  (compile compile-command)
)

(defun stane-apk-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make apk -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_Stane1983")
  (compile compile-command)
)



(defun coretech-compile-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_CoreTech")
  (compile compile-command)
)

(defun coretech-apk-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make apk -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc_CoreTech;/home/coolim/workspace/amlogic/dreamlink_t6/xbmc_CoreTech/restart.sh")
  (compile compile-command)
)


(defun xbmc-compile-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc-android2")
  (compile compile-command)
)

(defun xbmc-apk-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make apk -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc-android2")
  (compile compile-command)
)

(defun xbmc-compile-apk-command ()
  "현재 compile command 를 설정한다."
  (interactive)
  (setq compile-command "make -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc-android2;make apk -C /home/coolim/workspace/amlogic/dreamlink_t6/xbmc-android2")
  (compile compile-command)
)



;; (global-set-key "\C-c1" 'xbmc-compile-command)
;; (global-set-key "\C-c2" 'xbmc-apk-command)
;; (global-set-key "\C-c3" 'xbmc-compile-apk-command)
;; (global-set-key "\C-c3" 'coretech-compile-command)
;; (global-set-key "\C-c4" 'coretech-apk-command)


;; ===================================================================================================
;; Rotate Window , Window H->V , V->H
;; ===================================================================================================
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))




(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))
;; or some other keybinding...

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))


(defun capital-first-letter (word)
  (concat (upcase (string (elt word 0))) (substring word 1)))

(defun add-custom-desc-string ()
  (interactive)
  (insert ";;; ----- -----")
  (backward-char 5)
  (insert " ")
  (backward-char))

(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(defun insert-brackets ()
  "Inserts two brackets and locates point between"
  (interactive)
  (insert "[]")
  (backward-char))

(defun insert-braces ()
  "Inserts two braces and locates point between"
  (interactive)
  (insert "{}")
  (backward-char))

(defun insert-brakets ()
  "Inserts two brakets and locates point between"
  (interactive)
  (insert "<>")
  (backward-char))

(defun insert-quotes ()
  "Inserts two quotes and locates point between"
  (interactive)
  (insert "\"\"")
  (backward-char))

(defun insert-apostrophes ()
  "Inserts two apostrophes and locates point between"
  (interactive)
  (insert "''")
  (backward-char))



;; (global-set-key "(" 'insert-parentheses)
;; (global-set-key "<" 'insert-brakets)
;; (global-set-key "{" 'insert-braces)
;; (global-set-key "\"" 'insert-quotes)
;; (global-set-key "\'" 'insert-apostrophes)
;; (global-set-key "[" 'insert-brackets)




;; unicode shell
(defun unicode-shell ()
  "Execute the shell buffer in UTF-8 encoding.
Note that you'll need to set the environment variable LANG and others
appropriately."
  (interactive)
  (let ((coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8)
        (coding-system-require-warning t))
    (call-interactively 'shell)))



(defun dos2unix (buffer)
      "Automate M-% C-q C-m RET C-q C-j RET"
      (interactive "*b")
      (save-excursion
        (goto-char (point-min))
        (while (search-forward (string ?\C-m) nil t)
          (replace-match (string ?\C-j) nil t))))


;;Convert DOS cr-lf to UNIX newline
(defun dos-unix ()
  (interactive)
    (goto-char (point-min))
    (while (search-forward "\r" nil t) (replace-match "")))



;;Convert UNIX newline to DOS cr-lf
(defun unix-dos ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))


;;ASCII table function
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)  (switch-to-buffer "*ASCII*")  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))  (let ((i 0))
    (while (< i 254)      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))  (beginning-of-buffer))



;;make-comment-italic
(defun make-comment-italic ()
  (interactive "*")
  (make-face-italic 'font-lock-comment-face))

;;make-comment-unitalic
(defun make-comment-unitalic ()
  (interactive "*")
  (make-face-unitalic 'font-lock-comment-face))

;;make-comment-invisible
(defun make-comment-invisible ()
  (interactive "*")
  (custom-set-faces
 '(font-lock-comment-face ((((class color)) (:foreground "white"))))))

;;make-comment-visible
(defun make-comment-visible ()
  (interactive "*")
  (custom-set-faces
 '(font-lock-comment-face ((((class color)) (:foreground "green4"))))))

;;make-comment-red
(defun make-comment-red ()
  (interactive "*")
  (custom-set-faces
 '(font-lock-comment-face ((((class color)) (:foreground "red3"))))))


;;run the current perl program
(defun run-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl ")
  (insert perl-run-command)
  (insert perl-buffer-name)
)

;;debug the current perl program
(defun debug-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl -d ")
  (insert perl-run-command)
  (insert perl-buffer-name)
)

;;Add perl print template
(defun insert-perl-print ()
  "Add perl print template"
  (interactive "*")
  (setq steve-var "print \"\\n\";")
  (insert steve-var)
)

;;Add perl die template
(defun insert-perl-die ()
  "Add perl die template"
  (interactive "*")
  (setq steve-var "or die \" : $!\";")
  (insert steve-var)
)


(defun wrap-all-lines ()
  "Enable line wrapping"
  (interactive) ;this makes the function a command too
  (set-default 'truncate-lines nil)
)

(defun open-dot-emacs ()
  "opening-dot-emacs"
  (interactive) ;this makes the function a command too
  (find-file "C:\.emacs")
)



;; Toggles between line wrapping in the current buffer.
(defun toggle-line-wrapping ()
  "Toggles between line wrapping in the current buffer."
  (interactive)
  (if (eq truncate-lines nil)
      (progn
        (setq truncate-lines t)
        (redraw-display)
        (message "Setting truncate-lines to t"))
    (setq truncate-lines nil)
    (redraw-display)
    (message "Setting truncate-lines to nil"))
  )

(defun search-google ()
  "Prompt for a query in the minibuffer, launch the web browser and query google."
  (interactive)
  (let ((search (read-from-minibuffer "Google Search: ")))
    (browse-url (concat "http://www.google.com/search?q=" search))))

(defun search-word ()
 "Prompt for a query in the minibuffer, launch the web browser and query naver."
(interactive)
(let ((search (read-from-minibuffer "Naver English Dictionary Search: ")))
    (browse-url (concat "http://endic.naver.com/search.nhn?query=" search))))





;; Inserts the user name 
(defun insert-userid ()
  "Insert the my full name and address"
  (interactive)
	(insert user-full-name " <" user-mail-address ">"))


;원하는 위치에 날짜를 넣을 수 있다. 
(defun insert-date2 ()
"Insert date at point."
(interactive)
(insert (format-time-string "%a %b %e, %Y %l:%M %p")))
;; 수 11월  2, 2016  5:16 오후







(defun copy-line (n)
;;    "Copy N lines at point to the kill-ring."
    "한줄카피 여러줄도 된다"
    (interactive "p")
    (kill-ring-save (line-beginning-position) (line-beginning-position (1+ n))))

 (global-set-key "\C-ck" 'copy-line)

;; Copies line and appends buffer name to the front of it
;; used in checking the Charniak/Gomez parsers

(defun copy-line-with-filename (n)
    "Copy N lines at point to the kill-ring."
    (interactive "p")
    (kill-ring-save (line-beginning-position) (line-beginning-position (1+ n)))
    (kill-append (concat (buffer-name) ": ") '1)
)

;;(global-set-key "\C-ck" 'copy-line-with-filename)


;; the long missed vi like yy command
;; (defun missed-yy (n)
;;   "Copy N lines at point to the kill-ring."
;;   (interactive "p")
;;   (kill-ring-save (line-beginning-position) (line-beginning-position(1+ n))))

;; (global-set-key "\C-xy" 'missed-yy)


;; .emacs 파일 내에 다음과 같은 내용을 적습니다.

;; function to reload .emacs
;; (defun reload-dotemacs ()
;;   "Reload .emacs"
;;   (interactive)
;;   (load-file "~/.emacs"))









(provide 'emacs-function)
;;; emacs-function.el ends here


