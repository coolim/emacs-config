;;; init.el --- emacs init configuration file
;;; Copyright (C) 2016 by KudzuValley



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Current User : %s" current-user)

(when (version< emacs-version "25.1")
  (error "This File requires at least GNU Emacs 25.1, but you're running %s" emacs-version))

;; ~/.emacs.d/
(defvar emacs-dir (file-name-directory load-file-name)
  "The root dir of the Emacs")


;; ~/.emacs.d/lisp
(defvar emacs-lisp-dir (expand-file-name "lisp" emacs-dir)
  "The home of emacs's lisp")

;; ~/.emacs.d/core
(defvar emacs-core-dir (expand-file-name "core" emacs-dir)
  "The home of emacs's core")


;; ~/.emacs.d/modules
(defvar emacs-modules-dir (expand-file-name "modules" emacs-dir)
  "The home of emacs's modules")


(defvar emacs-savefile-dir (expand-file-name "savefile" emacs-dir)
  "This folder stores all the automatically generated save/history-files.")



;; ~/.emacs.d/savefile/emacs-registers
(defvar emacs-registers (expand-file-name "emacs-registers" emacs-savefile-dir)
  "emacs-registers file.")


(defvar emacs-modules-file (expand-file-name "emacs-modules.el" emacs-modules-dir)
  "emacs-modules file.")


;; savefile directory 가 없으면 만든다.
(unless (file-exists-p emacs-savefile-dir)
  (make-directory emacs-savefile-dir))


;;; emacs-registers file 이 없으면 만든다.
(unless (file-exists-p emacs-registers)
  (shell-command (concat "touch " emacs-registers)))
;; 디렉토리라면 아래처럼 하면 된다.
;; (make-directory emacs-registers)


;; add emacs directories `load-path'
(add-to-list 'load-path emacs-lisp-dir)
(add-to-list 'load-path emacs-core-dir)
(add-to-list 'load-path emacs-modules-dir)

;; 기본적으로 가비지 콜렉션을 실행하기 위한 사이즈를 늘린다.
;; 이러면 lisp을 실행하는 로딩시간이 짧아진다.
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)
;; (setq garbage-collection-messages t)

;; 용량이 큰 파일을 열 때 물어본다. 이것을 100MB 로 설정한다.
;; warn when opening files bigger than 100MB (default 10MB)
(setq large-file-warning-threshold 100000000)

(require 'emacs-setting)
(require 'emacs-packages)


;; load modules file (~/.emacs.d/modules/emacs-modules.el)
(if (file-exists-p emacs-modules-file)
    (load emacs-modules-file)
  (message "Missing modules file %s" emacs-modules-file))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "afbb40954f67924d3153f27b6d3399df221b2050f2a72eb2cfa8d29ca783c5a8" default)))
 '(package-selected-packages
   (quote
    (solarized-theme zenburn-theme guru-mode magit autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
