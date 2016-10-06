;;; emacs-ido.el --- ido-mode configuration
;;; Copyright (C) 2016 by KudzuValley
;;;


;; ido-mode 관련 내용을 정리해 보자.


;;; ido-ubiquitous 와 flx-ido, smex 를 자동설치 할 수 있는 함수를 불러와야 한다.
(emacs-require-packages '(flx-ido ido-ubiquitous smex))

(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)


(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" emacs-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-ubiquitous-mode +1)

;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" emacs-savefile-dir))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(provide 'emacs-ido)
;;; emacs-ido.el ends here

