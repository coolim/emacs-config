;;; emacs-registers.el --- manage emacs registers
;;; Copyright (C) 2016 by KudzuValley

;;************************************************************
;;               R E G I S T E R
;;************************************************************
;; use registers
;; To copy to named register: C-x r s a - Where a is the name of the
;; register ( a - z ) to save the text to.

;; To paste from named register: C-x r i a - Where a is the name of
;; the register ( a - z ) to paste the saved text from.

;; To remember current point: C-x r spc a - Where a is the name of the
;; register to save point to.

;; To jump to named point: C-x r j a - Where a is the name of the
;; register holding desired point to jump to


;; (defcustom save-register-file "~/.emacs.d/emacs-registers"
;;  "The place where the contents of the registers should be saved.")


(defcustom save-register-file emacs-registers
 "The place where the contents of the registers should be saved.")

(defun save-registers-to-file (&optional filename)
 "Print the contents of all registers to a file as loadable data.
  Cannot save window/frame configuration.
  But it works with keyboard macros, text, buffernames,
  filenames and rectangles."
 (interactive "register which file?")
 (let ((fn (or filename save-register-file))
        (print-level nil) ;Let us write anything
        (print-length nil)
       (b (generate-new-buffer "*registers*")))
   (set-buffer b)
   (dolist (i register-alist)
     (let ((char (car i))
           (contents (cdr i)))
       (cond
        ((stringp contents)
         (insert (format "%S\n"
                        `(set-register
                          ,char
                          ,contents))))
        ((numberp contents) ;numbers are printed non-quotes
         (insert (format "%S\n" `(set-register ,char ,contents))))
        ((markerp contents)
         (insert (format
                  "%S\n"
                  `(set-register
                    ,char
                    '(file-query
                     ,(buffer-file-name (marker-buffer contents))
                     ,(marker-position contents))))))
        ((bufferp (cdr contents))
         (insert (format "%s\n"
                         `(set-register ,char
                                        ',(buffer-name (cdr contents))))))
        (t (when (and contents ; different from nil
                      (not (or (window-configuration-p (car contents))
                               (frame-configuration-p (car contents)))))
             (insert (format "%S\n"
                             `(set-register ,char (quote ,contents)))))))))
   (write-file fn)
   (kill-buffer b)))



(add-hook 'kill-emacs-hook 'save-registers-to-file)
(load-file save-register-file)

(defun save-now-register-file ()
  "save register file, recentf 파일도 저정하게 만든다."
  (interactive)
  (save-registers-to-file)
  ;; (when (require 'recentf nil 'noerror)
  ;; 	(recentf-save-list))
  )

(global-set-key (kbd "\C-csr")   'save-now-register-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'emacs-registers)
;;; emacs-registers.el ends here
