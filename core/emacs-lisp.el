(defvar lists
  '(
    autopair
    )
  "설치할 패키지 목록들이다.")


(unless (memq 'magit lists)
  (add-to-list 'lists 'magit))

(add-to-list 'lists 'autopair)

(defun temp-installed-package (package)
  "package 가 설치되어 있는지 아닌지 판별한다."
  (message "package name : %s" package)
  (if (package-installed-p package)
      (message "Already installed %s" package)
    (message "not installed")))

(remove 'magit lists)

(mapc #'temp-installed-package lists)
(every #'temp-installed-package lists)

;;(mapc #'test-require-package testlists)

(defun test-packages-installed-p ()
  (every #'package-installed-p lists))

(setq lists (remove 'magit lists))
(setq lists (remove 'autopair lists))


;;(every #'test-require-package testlists)
(unless (every #'temp-installed-package lists)
  (message "return ???"))


(unless (test-packages-installed-p)
  (message "return ???"))



(defun test2-packages-installed-p (package)
  (message "package name : %s" package)
   (package-installed-p package))



(mapc #'test2-packages-installed-p lists)
(every #'test2-packages-installed-p lists)

(unless (every #'test2-packages-installed-p lists)
  (message "%s" "test"))





(defvar emacs-theme-lists
  '("check1"
    "check2"
    "check3"))


(defvar emacs-func-lists
  '((load-theme 'solarized-rk t)
    (load-theme 'zenburn t)))


(defconst emacs-func-lists2
  '((load-theme 'solarized-dark t)
    (load-theme 'zenburn t)))


(random t)
(random (length emacs-theme-lists))
(length emacs-func-lists)
(random (length emacs-func-lists))

(nth (random (length emacs-theme-lists)) emacs-theme-lists)

(message "%s"(nth (random (length emacs-func-lists)) emacs-func-lists))

(nth (random (length emacs-func-lists)) emacs-func-lists)

(load-theme (quote solarized-dark))


(load-theme (quote solarized-dark) t)

(load-theme (quote zenburn) t)


(nth (random (length emacs-func-lists)) emacs-func-lists)

(eval (nth (random (length emacs-func-lists2)) emacs-func-lists2))







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  emacs-lisp study
;;
;; C-x C-e를 하면 간단한 결과를 얻을 수 있다.
;; 
;; (buffer-file-name)
;; 현재 버퍼의 파일 이름을 알려준다. (path 포함해서)
;;
;; (file-name-sans-extension buffer-file-name)
;; 현재 버퍼의 파일이름을 확장자를 빼고 알려준다. (path 포함해서)
;; 
;; (file-name-nondirectory buffer-file-name)
;; 현재 버퍼의 파일 이름을 알려준다. (path를 포함하지 않는 순수 파일이름만 알려준다.)
;;
;; (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))
;; path가 포함되지 않은 순수파일에서 확장자를 뺀다. 이러면 바로 순수 파일이름만 얻을 수 있다.
;;
;;(file-name-extension (buffer-file-name))
;;확장자만 얻을 있다.
;;
;;
;; (file-name (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
;; 확장자를 뺀 순수파일이름만 file-name이라는 변수에 저장을 한다.
;; (file-ext (file-name-extension (buffer-file-name)))
;; 파일 확장자만 file-ext에 저장을 한다.
;; 위에서 let이라는 함수를 사용해 먼저 변수를 저장하고 있어야 한다.
 
;; (concat "javac -g "
;;         (file-name-nondirectory 
;;          (buffer-file-name))))))
;; concat은 두개의 문자열을 하나로 만든다.
;; 결과는 "javac -g filename" 이 될것이다.
;;
;; eval-buffer  : Execute the current buffer as Lisp code.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(defun debug-msg (fmt &rest args)
  "Show a build message."
  (if noninteractive
      (princ (apply 'format fmt args) t)
    (switch-to-buffer "*madman93 debug log*" t)
    (goto-char (point-max))
    (insert (apply 'format fmt args))
    (sit-for 0)))
 
;;; example
;; (debug-msg "CEDET BYTE COMPILATION STATUS:\n\n")





;; 아래 처럼 하면 *scratch* 에 있는 내용이 현재  buffer 에 그대로 표시된다.
;;(insert-buffer "*scratch*")

;; scratch 버퍼에 있는 내용중에 1 라인 20번째 글자까지만 입력한다.
;;(insert-buffer-substring "*scratch*" 1 20) 



;; mini buffer 가 active 되어 있을 때 포커스가 바로 간다.
;; (defun switch-to-minibuffer ()
;;   "Switch to minibuffer window."
;;   (interactive)
;;   (if (active-minibuffer-window)
;;       (select-window (active-minibuffer-window))
;;     (error "Minibuffer is not active")))

;; (global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o'
