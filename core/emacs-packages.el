;;; emacs-packages.el --- Emacs default package selection.



;; ************************************************************
;;        P A C K A G E S     L I S T
;; ************************************************************
(require 'cl)
(require 'package)


;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;; 			 ("marmalade" . "http://marmalade-repo.org/packages/")
;; 			 ("melpa" . "http://melpa.milkbox.net/packages/")))
;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)


(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; 원래 ~/.emacs.d/elpa 인데 아래 설정을 하지 않으면 어떻게 되는가?
;; set package-user-dir to be relative to Prelude install path
;; (setq package-user-dir (expand-file-name "elpa" prelude-dir))


;; 설치된 패키지들 활성화
(package-initialize)



;; 설치할 목록들이다.
(defvar emacs-packages
  '(
    autopair
    magit
    )
  "설치할 패키지 목록들이다.")

;;; 패키지 인스톨을 실행한다고 바로 설치가 되는것이 아니다.
;;; `package-refresh-contents' 를 통해 refresh 를 하고 `package-install' 명령을 내려야 한다.

;; autopair 가 설치되어 있지 않다면 설치한다.
;; (unless (package-installed-p 'autopair)
;;   (package-refresh-contents)
;;   (package-install 'autopair)
;;   (message "autopair-mode done."))


;; autopair 가 설치되어 있다면 message 가 나온다.
;; (when (package-installed-p 'autopair)
;;   (message "autopair installed"))



;; 현재 `emacs-packages' 목록에 있는 패키지가 설치되어져 있는지 확인한다.
;; cl에 있는 함수이다. `emacs-packages' 에 있는 리스트 목록에서 하나씩 가져와서 `package-installed-p' 를 체크한다.
;; 그 중에 하나가 오류가 생기면 바로 리턴되어진다.
(defun emacs-packages-installed-p ()
  "Check if all pakcages in `emacs-packages' are installed"
  (every #'package-installed-p emacs-packages))

;;; emacs-packaged 목록에 있는 것중에 하나라도 설치되어 있지 않다면
;; (unless (emacs-packages-installed-p)
;;   (message "%s" "fucking not installed"))

;;; emacs-packaged 목록에 있는 것이 전부 설치 되어 있다면 
;; (when (emacs-packages-installed-p)
;;   (message "%s" "all installed. Good Job :D"))


;; (defun emacs-packages-install-query ()
;;   "`emacs-packages' 가 설치 되어 있는가?"
;;   (interactive)
;;   (if (emacs-packages-installed-p)
;;       (message "%s" "success great")
;;     (message "%s" "failed fuck")))


;;; 파라미터로 하나의 패키지가 들어간다.
(defun emacs-require-package (package)
  "package 설치되어 있지 않으면 `emacs-packages' 목록에 추가하고 package 설치한다"
  (unless (memq package emacs-packages)     ;; `emacs-packages' 목록에 package 가 없으면
    (add-to-list 'emacs-packages package))  ;; `emacs-packages' 목록에 추가한다.
  (unless (package-installed-p package)     ;; package 가 설치되어 있지 않으면
    (package-install package)))             ;; package 를 설치한다.



;;; `emacs-require-package' 에 목록을 파라미터로 넣기 위해서 mapc 를 이용한다.
(defun emacs-require-packages (packages)
  "목록을 가지고 설치 유무를 판단해서 패키지 설치한다."
  (mapc #'emacs-require-package packages))  ;; mapc 를 통해서 목록별로 `emacs-require-package' 함수를 호출한다.




(defun emacs-install-packages ()
  "`emacs-packages' 목록에 있는 패키지들을 설치한다."
  (unless (emacs-packages-installed-p) ;; `emacs-packages-installed-p' 를 통해 `emacs-packages' 목록에 설치되어 있지 않은 패키지가 있다면
    (message "%s" "Emacs install packages...")
    (package-refresh-contents) ;; 설치하기 전에 package listing 을 해야 한다.
    (message "%s" " done.")
    (emacs-require-packages emacs-packages) ;; 미처 설치 되지 않은 `emacs-packages' 에 있는 패키지를 설치한다.
    ))

;; 아래 함수를 실행해도 `emacs-packages' 에 있는 목록에 모두 설치 되어 있다면 loading 속도는
;; 신경을 쓰지 않아도 될것이다.
(emacs-install-packages)


;; 이미 갱신되어진 package list 를 보여준다.
;; (package-show-package-list)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LISP EXAMPLES
;;
;;
;; 아래 예제들 통해서 lisp 을 익힌다.

;; lists 선언
(defvar lists
  '(
    autopair
    )
  "설치할 패키지 목록들이다.")


;; (memq package emacs-packages)
;; memq 는 emacs-packages 에 목록에 package 라는 것이 없으면 return 한다.
;; magit 가 lists 에 없으면 lists 에 magit 를 추가한다.
(unless (memq 'magit lists)
  (add-to-list 'lists 'magit))
;; (magit autopair)

(defun temp-installed-package (package)
  "package 가 설치되어 있는지 아닌지 판별한다."
  (message "package name : %s" package)
  (if (package-installed-p package)             ;; condition
      (message "Already installed %s" package)  ;; true
    (message "not installed")))                 ;; false


;; (mapc FUNCTION SEQUENCE)
;; mapc 는 함수는 SEQUENCE 의 목록을 FUNCTION의 파라미터로 받아들인다.
;; return 값은 목록이다.

(mapc #'temp-installed-package lists)

;; (every PREDICATE SEQ...)
;; every 는 mapc 와 동일하지만 return 값이 t or nil 이다.

(every #'temp-installed-package lists)


;; package-activated-list
;;(autopair magit git-commit magit-popup with-editor dash async)

;; emacs-packages
;;(autopair magit)

;;(set-difference LIST1 LIST2 [KEYWORD VALUE]...)
;; LIST1 에서 LIST2 에 있는 내용을 뺀 상태에서의 LIST1 이 결과이다..
(set-difference package-activated-list emacs-packages)
;; 결과는 아래와 같다.
;; (git-commit magit-popup with-editor dash async)

;; LIST1 에서 LIST2 의 목록을 빼면 LIST1에는 아무것도 남지 않는다.
(set-difference emacs-packages package-activated-list)
;; 그러므로 결과는  nil 이다.

;; 현재 Active 되어져 있는 것들중에 emacs-packages 에 없는 것들을 보여준다.
;; 아래 구문은 실행되어지면 바로 package 목록이 보여지기 때문에 주석처리 한다.
;;(package-show-package-list (set-difference package-activated-list emacs-packages))


;;
;; LISP EXAMPLES
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(provide 'emacs-packages)
;;; emacs-packages.el ends here



