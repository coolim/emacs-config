;;; emacs-osx.el --- emacs-osx configuration
;;; Copyright (C) 2016 by KudzuValley

;;; OSX 에서만 동작한다.

;;; command 키를 meta키로 사용해야 편하다.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))


(provide 'emacs-osx)
;;; emacs-osx.el ends here
