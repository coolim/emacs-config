;;; emacs-bookmark.el --- emacs-bookmark configuration
;;; Copyright (C) 2016 by KudzuValley

;; ************************************************************
;;             B O O K M A R K
;; ************************************************************
(setq mark-list                 nil)
(setq mark-max-count            10)
 
(defun set-bookmark (mrk)
  "Set bookmark routine."
  (interactive nil)
  (setq wc (current-column) wl (count-lines 1 (point)))
    (if (eq wc 0)
 (setq wl (1+ wl))
    )
  (setq found-element (assoc mrk mark-list))
  (cond
    ((and (not (null found-element))
          (car (cdr (cdr (cdr (cdr found-element)))))
     )
      (cond
        ((y-or-n-p (format "Bookmark #%d exist (buffer:\"%s\" L:%d C:%d). Overwrite it ? "
      (car found-element)
      (car (cdr (cdr (cdr found-element))))
      (car (cdr found-element))
      (1+ (car (cdr (cdr found-element))))
      )
         )
   (setq found-element (list mrk wl wc (buffer-name) t))
   (setq mark-list (cons found-element mark-list))
   (message "Bookmark #%d dropped in buffer \"%s\" L:%d C:%d."
     (car found-element)
     (car (cdr (cdr (cdr found-element))))
     (car (cdr found-element))
     (1+ (car (cdr (cdr found-element))))
          )
        )
        (t
   (message "Bookmark #%d not overwrited" (car found-element))
        )
      )
     )
     (t
       (setq mark-list (cons (list mrk wl wc (buffer-name) t) mark-list))
       (message "Bookmark #%d dropped in buffer \"%s\" L:%d C:%d."
   mrk (buffer-name) wl (1+ wc))
     )
  )
)
 
(defun goto-book ()
  "Goto bookmark"
  (interactive nil)
  (message "Goto Bookmark #")
  (goto-bookmark (- (read-char) ?0))
)
 
(defun goto-bookmark (mrk)
  "Goto bookmark"
  (interactive nil)
  (setq found-element (assoc mrk mark-list))
  (cond
    ((null found-element)
      (message "Bookmark number #%d not exist !!!" mrk)
    )
    (t
      (switch-to-buffer (car (cdr (cdr (cdr found-element)))))
      (set-buffer (car (cdr (cdr (cdr found-element)))))
      (goto-line (car (cdr found-element)))
      (move-to-column (car (cdr (cdr found-element))))
    )
  )
)
 
;;;   Alt-1...Alt-9  - Set bookmark
(global-set-key "\M-1"  '(lambda() (interactive nil) (set-bookmark 1)))
(global-set-key "\M-2"  '(lambda() (interactive nil) (set-bookmark 2)))
(global-set-key "\M-3"  '(lambda() (interactive nil) (set-bookmark 3)))
(global-set-key "\M-4"  '(lambda() (interactive nil) (set-bookmark 4)))
(global-set-key "\M-5"  '(lambda() (interactive nil) (set-bookmark 5)))
(global-set-key "\M-6"  '(lambda() (interactive nil) (set-bookmark 6)))
(global-set-key "\M-7"  '(lambda() (interactive nil) (set-bookmark 7)))
(global-set-key "\M-8"  '(lambda() (interactive nil) (set-bookmark 8)))
(global-set-key "\M-9"  '(lambda() (interactive nil) (set-bookmark 9)))
(global-set-key "\M-0"  '(lambda() (interactive nil) (set-bookmark 0)))
(global-set-key "\C-cj"  'goto-book)



(provide 'emacs-bookmark)
;;; emacs-bookmark.el ends here
