;;; emacs-web.el --- emacs-web configuration
;;; Copyright (C) 2016 by KudzuValley


(emacs-require-packages '(web-mode))

;; ==================================
;; web-mode
;; ==================================
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'" . web-mode))


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)  
  (setq web-mode-css-indent-offset 2)     
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)
  (setq web-mode-comment-style 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)  
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; make web-mode play nice with smartparens
;; (setq web-mode-enable-auto-pairing nil)


;; 이건또 뭐하는건가?
;; (sp-with-modes '(web-mode)
;;   (sp-local-pair "%" "%"
;;                  :unless '(sp-in-string-p)
;;                  :post-handlers '(((lambda (&rest _ignored)
;;                                      (just-one-space)
;;                                      (save-excursion (insert " ")))
;;                                    "SPC" "=" "#")))
;;   (sp-local-tag "%" "<% "  " %>")
;;   (sp-local-tag "=" "<%= " " %>")
;;   (sp-local-tag "#" "<%# " " %>"))


;; 아래는 뭐하는건지??? 나중에 보자.
;; (eval-after-load 'web-mode
;;   '(progn
;;      (defun prelude-web-mode-defaults ())
;;      (setq prelude-web-mode-hook 'prelude-web-mode-defaults)

;;      (add-hook 'web-mode-hook (lambda ()
;;                                 (run-hooks 'prelude-web-mode-hook)))))




(provide 'emacs-web)
;;; emacs-web.el ends here
