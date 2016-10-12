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




(provide 'emacs-function)
;;; emacs-function.el ends here
