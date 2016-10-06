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
    )
  "설치할 패키지 목록들이다.")

;;; 패키지 인스톨을 실행한다고 바로 설치가 되는것이 아니다.
;;; package-refresh-contents 를 통해 refresh 를 하고 package-install 명령을 내려야 한다.

;; autopair 가 설치되어 있지 않다면 설치한다.
;; (unless (package-installed-p 'autopair)
;;   (package-refresh-contents)
;;   (package-install 'autopair)
;;   (message "autopair-mode done."))


;; autopair 가 설치되어 있다면 message 가 나온다.
;; (when (package-installed-p 'autopair)
;;   (message "autopair installed"))



;; 현재 emacs-packages 목록에 있는 패키지가 설치되어져 있는지 확인한다.
;; cl에 있는 함수이다. emacs-packages 에 있는 리스트 목록에서 하나씩 가져와서 package-installed-p 를 체크한다.
;; 그 중에 하나가 오류가 생기면 바로 리턴되어진다.
(defun emacs-packages-installed-p ()
  "Check if all pakcages in `emacs-packages' are installed"
  (every #'package-installed-p emacs-packages))

;;; emacs-packaged 목록에 있는 것중에 하나라도 설치되어 있지 않다면
(unless (emacs-packages-installed-p)
  (message "%s" "fucking not installed"))

;;; emacs-packaged 목록에 있는 것이 전부 설치 되어 있다면 
(when (emacs-packages-installed-p)
  (message "%s" "all installed. Good Job :D"))


(defun emacs-packages-install-query ()
  "`emacs-packages' 가 설치 되어 있는가?"
  (interactive)
  (if (emacs-packages-installed-p)
      (message "%s" "success great")
    (message "%s" "failed fuck")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LISP EXAMPLES
;;

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




(provide 'emacs-packages)
;;; emacs-packages.el ends here



