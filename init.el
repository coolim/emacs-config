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


(defvar emacs-custom-file (expand-file-name "emacs-custom.el" emacs-savefile-dir)
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


(require 'emacs-packages)
(require 'emacs-function)
(require 'emacs-setting)
(require 'emacs-keybindings)
(require 'emacs-font)
(require 'emacs-programming)
(require 'emacs-registers)
(require 'emacs-extension) ;; file extension
(require 'emacs-email)
(require 'emacs-candidate) ;; emacs lisp candidate


(when (eq system-type 'darwin)
  (require 'emacs-osx))


;; load modules file (~/.emacs.d/modules/emacs-modules.el)
(if (file-exists-p emacs-modules-file)
    (load emacs-modules-file)
  (message "Missing modules file %s" emacs-modules-file))


;; init.el 에 자꾸 custom-set-variables 가 생기기 때문에 git 버전 관리가 되지 않고 있다.
;; 이 부분을 custom-file 로 지정해서 (~/emacs.d/savefile/emacs-custom.el) 따로 관리한다.
;; savefile 은 git ignore directory 이기 때문에 편하다.
;; emacs-custom-file 이 존재한다면 load 한다.
(setq custom-file emacs-custom-file)
(when (file-exists-p emacs-custom-file)
  (load emacs-custom-file))





