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



