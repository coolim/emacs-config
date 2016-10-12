;;; emacs-candidate.el --- emacs-candidate configuration
;;; Copyright (C) 2016 by KudzuValley

;; 기능 검증을 한다.



; highligt enable
(global-font-lock-mode t)


; maximum colors
(setq font-lock-maximum-decoration t)

; highlight during query
(setq query-replace-highlight t)

; highlight incremental search
(setq search-highlight t)               
 
(setq font-lock-maximum-size nil)

;; dynamic-completion-mode 가 정의 되어 있다면(fboundp) 설정한다.
(if (fboundp 'dynamic-completion-mode) (dynamic-completion-mode t))


(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(setq track-eol nil)
(setq scroll-step 1)
(setq hscroll-step 1)

(global-set-key "\C-m" 'newline-and-indent)

;; auto fill 이라는 것은 문장을 계속 쓰다가 Space 가 들어가면 자동으로 여러라인으로 나누어 진다.
;; M-q 와 비슷하다고 봐도 무방하다. 이 모드는 별로 선호하는 기능은 아니다.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq find-file-visit-truename nil)
;;(buffer-file-name)
;;(file-truename (buffer-file-name))



;; 이미 기본적으로 transient 가 되어 있지만 확실하게 하자.
(if (fboundp 'transient-mark-mode) (transient-mark-mode t))


;;; Dired
;; Allows recursive deletes
;; 지우고자 하는 디렉토리에 하위 디렉토리가 존재하면 하위 디렉토리까지 지울거냐고 물어본다.
;; nil : 하위 디렉토리를 삭제하지 못한다.
;; top : 물어보고 삭제한다.
;; always : 물어보지 않고 삭제한다.
;; 아래 default 값이 top 이다.
(setq dired-recursive-deletes 'top)



;;;;; 뭐하는 기능인고... 잘 모르겠네
;;; Rectangles

;; Compliment to kill-rectangle (just like kill-ring-save compliments        
;; kill-region)                                                              
;; http://www.emacsblog.org/2007/03/17/quick-tip-set-goal-column/#comment-183
(defun kill-save-rectangle (start end &optional fill)
  "Save the rectangle as if killed, but don't kill it.  See
`kill-rectangle' for more information."
  (interactive "r\nP")
  (kill-rectangle start end fill)
  (goto-char start)
  (yank-rectangle))

;; Give it a memorable key binding
(global-set-key (kbd "C-x r M-k") 'kill-save-rectangle)



;; 최근에 오픈한 파일의 목록을 보여준다.
;; 일단 해 봐라 좋다.
;;recentf
;;helm-recentf(F12) 가 있기 때문에 아래 사용을 별로 하지 않지만 좋은 기능이다.
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-saved-items 500)
;; (setq recentf-max-menu-items 60)
;; (global-set-key [(meta f12)] 'recentf-open-files)



;;; Flymake

(defface flymake-errline '((t (:background "#330000" :overline "red" :underline "red"))) nil)
(defface flymake-warnline '((t (:background "#333300" :overline "yellow" :underline "yellow"))) nil)






;;;; 아래 구문을 공부하자.

(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
           (url-hexify-string
            (if mark-active
                (buffer-substring (region-beginning) (region-end))
              (read-string prompt))))))


(defmacro prelude-install-search-engine (search-engine-name search-engine-url search-engine-prompt)
  "Given some information regarding a search engine, install the interactive command to search through them"
  `(defun ,(intern (format "prelude-%s" search-engine-name)) ()
       ,(format "Search %s with a query or region if any." search-engine-name)
       (interactive)
       (prelude-search ,search-engine-url ,search-engine-prompt)))

(prelude-install-search-engine "google"     "http://www.google.com/search?q="              "Google: ")
(prelude-install-search-engine "youtube"    "http://www.youtube.com/results?search_query=" "Search YouTube: ")
(prelude-install-search-engine "github"     "https://github.com/search?q="                 "Search GitHub: ")
(prelude-install-search-engine "duckduckgo" "https://duckduckgo.com/?t=lm&q="              "Search DuckDuckGo: ")


(global-set-key "\C-Cg" 'prelude-google)



;;;;;; 외부 브라우저 말고 emacs  내부 브라우저만으로 하는 방법을 연구해 본다.
(defun google (what)
  "Use google to search for WHAT."
  (interactive "sSearch: ")
  (save-window-excursion
    (delete-other-windows)
    (let ((dir default-directory))
      (browse-url (concat "http://www.google.com/search?q=" what))
      (cd dir)
      (recursive-edit))))

(global-set-key "\C-Cg" 'google)




(defun search-word ()
 "Prompt for a query in the minibuffer, launch the web browser and query naver."
(interactive)
(let ((search (read-from-minibuffer "Naver English Dictionary Search: ")))
    (browse-url (concat "http://endic.naver.com/search.nhn?query=" search))))

;; (global-set-key "\C-Cw" 'search-word)



;; (word-at-point) 를 쓰면 커서가 위치하고 있는 문자열을 얻어 올 수 있다.
(setq search-dic-url "http://endic.naver.com/search.nhn?query=%s")

;; (defun search-word-point ()
;;   (interactive)
;;   (browse-url (format search-dic-url (word-at-point))))

(defun search-word-point ()
  (interactive)
  (browse-url (format search-dic-url (read-from-minibuffer "English Dictionary : " (word-at-point)))))

(global-set-key "\C-cdic" 'search-word-point)



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
 
;;; 아래를 설정 
(autoload 'screen-lines-mode "screen-lines"
          "Toggle Screen Lines minor mode for the current buffer." t)
(autoload 'turn-on-screen-lines-mode "screen-lines"
          "Turn on Screen Lines minor mode for the current buffer." t)
(autoload 'turn-off-screen-lines-mode "screen-lines"
          "Turn off Screen Lines minor mode for the current buffer." t)
;;; M-x screen-lines-mode 명령으로 이 기능을 활성화 시킬 수 있다.





















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; java-mode setting start
;;
;;http://paste.lisp.org/display/62361
 
(autoload 'java-mode "java-mode" "Java mode" t)

(setq auto-mode-alist (append '(("\\.java$" . java-mode))
                              auto-mode-alist))


 
(defun my-java-mode-hook ()
  (define-key java-mode-map "\C-m" 'newline-and-indent)
  (define-key java-mode-map "\C-c\C-d" 'java-file-class-template)
  (define-key java-mode-map "\C-c\C-t" 'compile-current-file)
  (define-key java-mode-map "\C-c\C-r" 'run-current-file)
  (define-key java-mode-map "\C-c\C-s" 'java-start-end)
  (c-set-style "myJavaStyle")
)
(setq java-mode-hook 'my-java-mode-hook)
 
(c-add-style "myJavaStyle"
  '("Java"  ; this must be defined elsewhere - it is in cc-modes.el
  (c-basic-offset . 4)
  (c-echo-syntactic-information-p . t)
  (c-comment-only-line-offset . (0 . 0))
  (c-offsets-alist . (
    (c                     . c-lineup-C-comments)
    (statement-case-open   . 0)
    (case-label            . +)
    (substatement-open    . 0)  
    ))
  ))
 
(global-set-key "\M-/" 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev 
        try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill 
        try-complete-file-name-partially try-complete-file-name 
        try-expand-all-abbrevs try-expand-list try-expand-line  
        try-complete-lisp-symbol-partially try-complete-lisp-symbol))
 
;;; programmed by madman93
;;; utf-8인 경우는 javac -encoding UTF-8 -g filename
 
;; UTF-8 유니코드의 경우
;; javac -encoding UTF-8 Foo.java && java Foo
;; (utf8 로도 인식하더군요. 인터넷 웹문서용 유니코드는 UTF-8 이 표준입니다.)
 
;; UTF-16LE 유니코드의 경우
;; javac -encoding UTF-16LE Foo.java && java Foo
;; (MS윈도우에서는 UTF-16LE 유니코드가 사용됩니다.)
 
;; UTF-16BE 유니코드의 경우
;; javac -encoding UTF-16BE Foo.java && java Foo
;; (자바 가상머신은, 내부적으로 UTF-16BE 를 사용합니다.)
 

;; 유니코드가 아닌, 한글 완성형의 경우
;; javac -encoding euc-kr Foo.java && java Foo
;; 또는
;; javac -encoding 949 Foo.java && java Foo
;; (대문자로 EUC-KR 이렇게 적어도 되고, cp949, MS949 등을 사용해도
;; 인식했습니다.) 한글 윈도우에서는 한글 완성형 인코딩이 기본이기에
;; 지정해 줄 필요 없습니다.
 
;; 중요 업데이트: 자바에서 한글 완성형 인코딩을 명시적으로 지정해 줄
;; 때는 반드시 MS949 인코딩을 사용해야 " 방각하" 등의 확장완성형이
;; 표현됩니다.
 
(add-hook 'java-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "javac -g "
                         (file-name-nondirectory 
                          (buffer-file-name))))))
;;; 또는 아래처럼 let을 써서 file-name 변수를 만들어서 사용을 해도 된다.
;;; 아래 여러 함수들의 let쓰는 방법을 보면 쉽게 알 수 있다.
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (let (file-name)
;;               (setq file-name (file-name-nondirectory buffer-file-name))
;;               (set (make-local-variable 'compile-command)
;;                    (concat "javac -g "
;;                            file-name)))))
 

(defvar java-api-root "http://java.sun.com/javase/6/docs/api/")
(defvar path-sep-char ";") ; ":" on Linux
 
(defun java-api-lookup (name)
  (browse-url (if (string-match "^java.*\\." name)
                  (concat java-api-root (replace-regexp-in-string "\\." "/" name) ".html")
                (concat "http://www.google.com/search?q=java+6+" name))))
 
(defun java-api-current-word ()
  (interactive)
  (java-api-lookup (let* ((the-word (current-word))
                          (relevant-import (string-match (concat "^import \\([^" path-sep-char "]*" the-word "\\)")
                                                         (buffer-string))))
                     (if relevant-import
                         (match-string 1 (buffer-string))
                       the-word))))
 
(eval-after-load "cc-mode" '(define-key java-mode-map [f2] 'java-api-current-word))


(defvar use-debug-info nil)
(defvar use-scons nil)

(defvar scons-path-string "scons -Q")
 

(defun compile-current-file ()
  "Compiles/interprets file in current buffer"
  (interactive)
  (let (ext-map file-name file-ext prog-name)
    (if use-scons
 (shell-command scons-path-string)
      (if (not use-debug-info)
   (setq ext-map
  '(("java" . "javac")
    ("py" . "python3")))
 (setq ext-map
       '(("java" . "javac -g")
  ("py" . "python3"))))
      (setq file-name (file-name-nondirectory (buffer-file-name)))
      (setq file-ext (file-name-extension (buffer-file-name)))
      (shell-command (concat (cdr (assoc file-ext ext-map)) " " file-name)))))
 

(defun run-current-file ()
  "Runs/interprets file in current buffer"
  (interactive)
  (let* ((ext-map
 '(("java" . ("java" . nil))
   ("py" . ("python3" . t))))
 (file-name (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
 (file-ext (file-name-extension (buffer-file-name)))
 (use-file-ext-p (cddr (assoc file-ext ext-map)))
 (compiler-name (cadr (assoc file-ext ext-map)))
 args)
    (setq args (read-from-minibuffer "Execution Arguments: "))
    (if use-file-ext-p
 (shell-command (concat compiler-name " " file-name file-ext " " args))
 (shell-command (concat compiler-name " " file-name " " args)))))

(defun compile-use-scons ()
  (interactive)
  (setq use-scons t))


(defun java-getter-from-region (reg-beg reg-end)
  "Creates a getter for a variable in the region"
  (interactive "r")
  (let* ((var-string (buffer-substring reg-beg reg-end))
	 (string-list (split-string var-string " "))
	 (var-name (substring (cadr string-list) 0 -1)))
    (newline-and-indent)
    (newline-and-indent)
    (insert (concat "public " (car string-list) " " "get"
		    (capital-first-letter var-name)
		    "() {"))
    (newline-and-indent)
    (insert (concat "return " var-name ";"))
    (newline-and-indent)
    (insert "}")
    (c-indent-command)
    (newline-and-indent)))


(defun java-setter-from-region (reg-start reg-end)
  "Creates a setter for a variable in the region"
  (interactive "r")
  (let* ((var-string (buffer-substring reg-start reg-end))
	 (string-list (split-string var-string " "))
	 (type-id (car string-list))
	 (var-name (substring (cadr string-list) 0 -1))
	 (new-var (concat "new" (capital-first-letter var-name))))
    (newline-and-indent)
    (newline-and-indent)
    (insert "public void ")
    (insert (concat "set" (capital-first-letter var-name)))
    (insert (concat "(" type-id " " new-var ") {"))
    (newline-and-indent)
    (insert (concat var-name " = " new-var ";"))
    (newline-and-indent)
    (insert "}")
    (c-indent-command)
    (newline-and-indent)))

(defun java-accessor-from-region ()
  "Creates a setter and getter for a variable in the region"
  (interactive)
  (let ((reg-start (region-beginning)) (reg-end (region-end)))
    (java-getter-from-region reg-start reg-end)
    (java-setter-from-region reg-start reg-end)))

(defun java-make-class-template ()
  "If a class name is in the region then a skeleton class will be formed"
  (interactive)
  (let ((class-name (buffer-substring (region-beginning) (region-end))))
    (delete-region (region-beginning) (region-end))
    (insert (concat "public class " class-name " {"))
    (newline-and-indent)
    (newline-and-indent)
    (insert "}")
    (c-indent-command)
    (previous-line)
    (c-indent-command)))


;; 아래 함수와 가로 차이만 있다. 현재 이걸 사용하지만 자바 형식을 따라 한번 해 볼까 한다.
;; (defun java-file-class-template ()
;;   "Creates a skeleton class from the file name of the current buffer"
;;   (interactive)
;;   (let ((class-name
;;   (file-name-sans-extension
;;    (file-name-nondirectory (buffer-file-name)))))
;;     (insert (concat "public class " class-name))
;;     (newline)
;;     (insert "{")
;;     (newline-and-indent)
;;     (newline-and-indent)
;;     (insert "}")
;;     (c-indent-command)
;;     (previous-line)
;;     (c-indent-command)))

(defun java-file-class-template ()
  "Creates a skeleton class from the file name of the current buffer"
  (interactive)
  (let ((class-name
	 (file-name-sans-extension
	  (file-name-nondirectory (buffer-file-name)))))
    (insert (concat "public class " class-name " {"))
    (newline-and-indent)
    (newline-and-indent)
    (insert "}")
    (c-indent-command)
    (previous-line)
    (c-indent-command)))


(defun java-use-debug-info ()
  (interactive)
  (setq use-debug-info t))

(defvar java-exec-class "")
(defvar java-exec-args "")

(defun java-set-exec-class ()
  (interactive)
  (setq java-exec-class (read-from-minibuffer "Execution Class: "))
  (setq java-exec-args (read-from-minibuffer "Arguments: ")))

(defun java-execute-file ()
  (interactive)
  (start-process-shell-command "Java compilation" "*Java compilation buffer*"  (concat "java " java-exec-args " " java-exec-class)))




 
 
;;; newline-and-indent보다 내가 맞는것은
;;; newline 명령을 하고 c-indent-command를 하는것이 나은 것 갈다.
;;; insert를 한뒤에 c-indent-command를 하는 것도 마찬가지 이다.
;;; 
(defun java-start-end ()
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
 
 
(setq completion-ignored-extensions
      (cons ".class" completion-ignored-extensions))

(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-g" 'java-getter-from-region)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-s" 'java-setter-from-region)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-a" 'java-accessor-from-region)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-d" 'java-file-class-template)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\M-f" 'c-forward-into-nomenclature)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\M-b" 'c-backward-into-nomenclature)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-l" 'java-execute-file)))
(add-hook 'java-mode-hook (lambda () (define-key java-mode-map "\C-c\C-v" 'java-set-exec-class)))
(add-hook 'java-mode-hook (lambda () (setq parens-require-spaces nil)))

(add-hook 'c-mode-hook (lambda () (define-key c-mode-base-map "\C-m" 'newline-and-indent)))
(add-hook 'c-mode-hook (lambda () (define-key c-mode-base-map "\M-f" 'c-forward-into-nomenclature)))
(add-hook 'c-mode-hook (lambda () (define-key c-mode-base-map "\M-b" 'c-backward-into-nomenclature)))
(add-hook 'c-mode-hook (lambda () (setq parens-require-spaces nil)))

 
;;;; java-mode setting end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; nxml-mode
;;
 
(setq auto-mode-alist
      (append '(("\\.html$"   . nxml-mode)
                ("\\.htm$" . nxml-mode)
                ("\\.xml$"  . nxml-mode)
                ("\\.xsd$"  . nxml-mode)
                ("\\.dtd$"  . nxml-mode))
              auto-mode-alist))
 
(defun my-nxml-mode-hook ()
  (define-key nxml-mode-map "\C-m" 'newline-and-indent)
  (define-key nxml-mode-map "\C-ce" 'browse-url-of-file)
;;  (c-set-style "mynXMLStyle")
)
 
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
            auto-mode-alist))
 
(setq nxml-mode-hook 'my-nxml-mode-hook)
 
;; (c-add-style "mynXMLStyle"
;;   '("nXML"  ; this must be defined elsewhere - it is in cc-modes.el
;;   (c-basic-offset . 4)
;;   ))
 
;; 위의 (c-basic-offset 4)가 필요가 없어 졌다.
;; 아래 설정값만 하면 좋다.
(setq nxml-child-indent 4)


;; custom dtd나 schema를 쓰려면 어떻게 해야할까?
;; trang을 사용해서 변환하면 된다.
;; $ trang /path/to/custom.dtd /path/to/custom.rnc emacs의
;; 메뉴에서 XML > Set Schema > File... 선택후 /path/to/custom.rnc를
;; 입력하면 즉시 편집중인 문서의 validation을 실행하고 결과를
;; 상태표시줄에 표시한다.
 
;; java -jar trang.jar cards.xml poker.xsd
 
(setq sgml-auto-activate-dtd nil)
 
;; nxhtml-mode
;; 나중에 한번 보자 좋은것 같긴 한데 아직 모르겠다.
;;(load "~/.emacs.d/nxhtml/autostart.el")



;;(iswitchb-mode t)


(defvar python-web-preview "")

(defun python-set-web-preview ()
  (interactive)
  (setq python-set-web-preview (read-from-minibuffer "Preview Python Webpage at: ")))

(defun python-preview-webpage ()
  (interactive)
  (shell-command (concat "firefox -new-tab " python-web-preview)))

(add-hook 'python-mode-hook (lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'python-mode-hook (lambda () (define-key python-mode-map "\C-c\C-p" 'python-preview-webpage)))
(add-hook 'python-mode-hook (lambda () (define-key python-mode-map "\C-c\C-s" 'python-set-web-preview)))
(add-hook 'python-mode-hook (lambda () (setq parens-require-spaces nil)))
(add-hook 'python-mode-hook (lambda () (setq fill-column 75)))
(add-hook 'python-mode-hook (lambda () (auto-fill-mode 1)))

(add-hook 'css-mode-hook (lambda () (define-key css-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'css-mode-hook (lambda () (define-key css-mode-map "\C-c\C-c" 'comment-region)))
(add-hook 'css-mode-hook (lambda () (define-key css-mode-map "\C-c\C-l" 'uncomment-region)))

(add-hook 'html-mode-hook (lambda () (define-key html-mode-map "\C-m" 'newline-and-indent)))



;;; google-maps
;; (require 'google-maps)


;;;;;;;;;;;;;;;;;;;;;;;;;;;; shell mode tab key

;; 1. 
;; (require 'shell-command)
;; (shell-command-completion-mode)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; 2.
;; M-x comint-dynamic-complete

;; 3.
;; M-x shell-resync-dirs
;;(global-set-key "\M-r" 'shell-resync-dirs)


;; emacs 25.1 에서는 사용을 안한다. 참고삼아 알아보자.
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;;;; yank 를 해서 저장되어져 있는 메뉴를 보여준다.
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))





;;;;;;;;;;;;;; python mode
;; (add-to-list 'load-path "~/.emacs.d/python-mode.el-6.0.3")
;; (load "~/.emacs.d/python-mode.el-6.0.3/python-mode.el")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))




;;;; SREP

;; scratch 버퍼에
;; (require 'srep) 를 설정을 하고
;; 임의의 텍스트 문서에서 1 2 를 작성을 하고 M-x srep --> delimiter: 이 나오면 C-q C-j 를 입력 하고 나서 원하는 범위를 선택을 하면
;; 자동으로 엑셀처럼 내용을 채워 준다.
;; 여기서 말하는 delimiter 은 일종의 구분자 인데
;; 1
;; 2
;; 이런식으로 입력을 하면 라인을 넘겨서 구분을 해야 입력이 되니깐 C-q C-j 를 입력을 하면 된다.

;; 예를 들어서
;; 00,01
;; 선택을 하고 M-x srep --> delimiter: , 콤마를 이용하면
;; 원하는 범위만큼 엑셀처럼 입력을 자동으로 할 수 있다.



;; C 언어에서

;; 다음과 같이 입력한 다음 
;; #define BIT_00 (1 << 0) 		/* 0x0001 */
;; #define BIT_01 (1 << 1) 		/* 0x0002 */

;; C-u 13 M-x srep 를 하면
;; 아래와 같은 결과가 나온다.

;; #define BIT_00 (1 << 0) 		/* 0x0001 */
;; #define BIT_01 (1 << 1) 		/* 0x0002 */
;; #define BIT_02 (1 << 2) 		/* 0x0004 */
;; #define BIT_03 (1 << 3) 		/* 0x0008 */
;; #define BIT_04 (1 << 4) 		/* 0x0010 */
;; #define BIT_05 (1 << 5) 		/* 0x0020 */
;; #define BIT_06 (1 << 6) 		/* 0x0040 */
;; #define BIT_07 (1 << 7) 		/* 0x0080 */
;; #define BIT_08 (1 << 8) 		/* 0x0100 */
;; #define BIT_09 (1 << 9) 		/* 0x0200 */
;; #define BIT_10 (1 << 10) 		/* 0x0400 */
;; #define BIT_11 (1 << 11) 		/* 0x0800 */
;; #define BIT_12 (1 << 12) 		/* 0x1000 */
;; #define BIT_13 (1 << 13) 		/* 0x2000 */
;; #define BIT_14 (1 << 14) 		/* 0x4000 */
;; #define BIT_15 (1 << 15) 		/* 0x8000 */



;; (require 'srep)
;; (srep-define-word-repeater
;;  muska
;;  '("a" "b" ", " "c" "d" "E" "F" "G" "!"))

;; (add-to-list 'srep-repeat-functions
;;              '(srep-ana:muska srep-rep:muska))



;;;; SREP

;; scratch 버퍼에
;; (require 'srep) 를 설정을 하고
;; 임의의 텍스트 문서에서 1 2 를 작성을 하고 M-x srep --> delimiter: 이 나오면 C-q C-j 를 입력 하고 나서 원하는 범위를 선택을 하면
;; 자동으로 엑셀처럼 내용을 채워 준다.
;; 여기서 말하는 delimiter 은 일종의 구분자 인데
;; 1
;; 2
;; 이런식으로 입력을 하면 라인을 넘겨서 구분을 해야 입력이 되니깐 C-q C-j 를 입력을 하면 된다.

;; 예를 들어서
;; 00,01
;; 선택을 하고 M-x srep --> delimiter: , 콤마를 이용하면
;; 원하는 범위만큼 엑셀처럼 입력을 자동으로 할 수 있다.



;; C 언어에서

;; 다음과 같이 입력한 다음 
;; #define BIT_00 (1 << 0) 		/* 0x0001 */
;; #define BIT_01 (1 << 1) 		/* 0x0002 */

;; C-u 13 M-x srep 를 하면
;; 아래와 같은 결과가 나온다.

;; #define BIT_00 (1 << 0) 		/* 0x0001 */
;; #define BIT_01 (1 << 1) 		/* 0x0002 */
;; #define BIT_02 (1 << 2) 		/* 0x0004 */
;; #define BIT_03 (1 << 3) 		/* 0x0008 */
;; #define BIT_04 (1 << 4) 		/* 0x0010 */
;; #define BIT_05 (1 << 5) 		/* 0x0020 */
;; #define BIT_06 (1 << 6) 		/* 0x0040 */
;; #define BIT_07 (1 << 7) 		/* 0x0080 */
;; #define BIT_08 (1 << 8) 		/* 0x0100 */
;; #define BIT_09 (1 << 9) 		/* 0x0200 */
;; #define BIT_10 (1 << 10) 		/* 0x0400 */
;; #define BIT_11 (1 << 11) 		/* 0x0800 */
;; #define BIT_12 (1 << 12) 		/* 0x1000 */
;; #define BIT_13 (1 << 13) 		/* 0x2000 */
;; #define BIT_14 (1 << 14) 		/* 0x4000 */
;; #define BIT_15 (1 << 15) 		/* 0x8000 */



;; (require 'srep)
;; (srep-define-word-repeater
;;  muska
;;  '("a" "b" ", " "c" "d" "E" "F" "G" "!"))

;; (add-to-list 'srep-repeat-functions
;;              '(srep-ana:muska srep-rep:muska))




;;;;;;;;;;;;;;;;; CHANGELOG ;;;;;;;;;;;;;;;;;;;;
(setq change-log-default-name "CHANGELOG") ;; default ChangeLog




;;;;;;;;;;;;;;;;;;; make face ;;;;;;;;;;;;;;;;;;;;;;;
;;; 언제 효용 가치가 있는지 모르겠다.
;;; 실제 //LYH 가 변하면 좋겠지만 일단 주석이 들어간 상태면 주석은 face가 우선이기 때문에
;;; 색이 변하지를 않는다.
;;; 그래서 LYH Begin만 하면 색이 변하기는 하지만 문제는 이 상태에서 컴파일 오류가 발생하기 때문에
;;; 다른 방법을 강구해야 하는데 현재로서는 할 생각이 없다
;;; 다음에 제대로 한번 해보자.


(make-face 'font-lock-special-macro-face)
(set-face-foreground 'font-lock-special-macro-face "pink")

(defun add-custom-keyw()
  "adds a few special keywords for c and c++ modes"
  ;
  (font-lock-add-keywords nil
                          '(
      ("\\<\\(MODIFIED BY LYH\\)" . 'font-lock-special-macro-face)                            
      ("\\<\\(LYH Begin\\)" . 'font-lock-special-macro-face)
      ("\\<\\(LYH End\\)" . 'font-lock-special-macro-face)      
      )
    )
  )


(add-hook 'c-mode-hook 'add-custom-keyw)
(add-hook 'c++-mode-hook 'add-custom-keyw)
(add-hook 'java-mode-hook 'add-custom-keyw)
(add-hook 'emacs-lisp-mode-hook 'add-custom-keyw)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)




;;;; bash completion

;; (autoload 'bash-completion-dynamic-complete 
;;   "bash-completion"
;;   "BASH completion hook")
;; (add-hook 'shell-dynamic-complete-functions
;;   'bash-completion-dynamic-complete)
;; (add-hook 'shell-command-complete-functions
;;           'bash-completion-dynamic-complete)


;; (require 'bash-completion)
;; (bash-completion-setup)




;; 현재 라인 복사하기 Emacs에서 현재 커서가 위치하고 있는 라인을
;; 복사하려면 일단 커서를 제일 앞으로 이동(C-a)한 후 영역선택을
;; 켜고(C-SPC) 라인 끝으로 이동(C-e)해서 복사(M-w)하는 복잡한(?)
;; 과정을 거쳐야 한다.

;; Emacs는 무한확장이 가능하다! 즉, 좀 더 간편히 하기 위해 Emacs의
;; 기능을 수정할 수 있다. 아래 스크립트를 실행시키고 난 뒤에는 영역
;; 선택 없이 M-w 키를 누르면 바로 현재 라인이 복사가 되어
;; 킬링(kill-ring)에 들어간다.

;; Vim에서 yy를 이용한 현재 라인 복사하기 기능이 부러웠다면 이 코드를

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is copied.")
       (list (line-beginning-position) (line-beginning-position 2)) ) ) ))

(defadvice kill-region (before slick-copy activate compile)
  "When called interactively with no active region, cut the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (list (line-beginning-position) (line-beginning-position 2)) ) ) ))


;;(bash-completion-setup)





(provide 'emacs-candidate)
;;; emacs-candidate.el ends here
