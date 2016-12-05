;;; emacs-w3m.el --- emacs-w3m configuration
;;; Copyright (C) 2016 by KudzuValley
(emacs-require-packages '(w3m))



(require 'w3m)


;; (setq w3m-command "/usr/bin/w3m"
;;       w3m-default-display-inline-images t
;;       w3m-bookmark-file-coding-system 'utf-8
;;       w3m-coding-system 'utf-8
;;       w3m-file-coding-system 'utf-8
;;       w3m-file-name-coding-system 'utf-8
;;       w3m-input-coding-system 'utf-8
;;       w3m-output-coding-system 'utf-8
;;       w3m-terminal-coding-system 'utf-8
;;       w3m-type (quote (quote w3m-m17n)))


;; (eval-after-load "w3m"
;;   '(pushnew '(ks_c_5601-1987 . euc-kr) w3m-charset-coding-system-alist))


;;(setq w3m-default-display-inline-images t)
;;(setq w3m-bookmark-file-coding-system 'utf-8)
;;(setq w3m-file-name-coding-system 'utf-8)
;;(setq w3m-terminal-coding-system 'utf-8)




;; (defun remove-w3m-output-garbages ()
;;   (interactive)
;;   (let ((buffer-read-only))
;;     (setf (point) (point-min))
;;     (while (re-search-forward "[\200-\240]" nil t)
;;       (replace-match " "))
;;     (set-buffer-multibyte t))
;;   (set-buffer-modified-p nil))

;; (add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)


(setq w3m-search-engine-alist '(("google" "http://www.google.com/search?q=%s&hl=ko&ie=utf-8&oe=utf-8" utf-8)
                ("google-en" "http://www.google.com/search?q=%s&hl=en&ie=utf-8&oe=utf-8" utf-8)
                ("google news" "http://news.google.co.kr/news?hl=ko&ie=utf-8&q=%s&oe=utf-8" utf-8)
                ("emacswiki" "http://www.emacswiki.org/cgi-bin/wiki?search=%s" nil)
                ("en.wikipedia" "http://en.wikipedia.org/wiki/Special:Search?search=%s" nil)
                ("ko.wikipedia" "http://ko.wikipedia.org/wiki/Special:Search?search=%s" utf-8)
                ("engdic" "http://translate.google.co.kr/translate_dict?q=%s&hl=ko&langpair=en|ko" utf-8)))
(setq w3m-uri-replace-alist '(("\\`eng:" w3m-search-uri-replace "engdic")
                  ("\\`we:" w3m-search-uri-replace "en.wikipedia")
                  ("\\`wk:" w3m-search-uri-replace "ko.wikipedia")))






(global-set-key "\C-cwv" 'w3m-bookmark-view)    ;; view bookmark
(global-set-key "\C-cwo" 'w3m-browse-url)    ;; open url




(provide 'emacs-w3m)
;;; emacs-w3m.el ends here
