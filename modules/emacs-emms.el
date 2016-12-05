;;; emacs-emms.el --- emacs-emms configuration
;;; Copyright (C) 2016 by KudzuValley

(emacs-require-packages '(emms))

;; ************************************************************
;;             M U S I C
;; ************************************************************

;;;;;; E M M S ;;;;;;;;;;;;;;;;;


;; 예전에 쓰던 것들인데 도움 될만한 것이 있다.
;; (require 'emms-setup)
;; (emms-standard)
;; ;;(emms-all)
;; (emms-default-players)

;; ;; ;; ;; Show the current track each time EMMS
;; ;; ;; ;; starts to play a track with "NP : "
;; (add-hook 'emms-player-started-hook 'emms-show)
;; (setq emms-show-format "NP: %s")
        
;; ;; ;; ;; When asked for emms-play-directory,
;; ;; ;; ;; always start from this one 
;; (setq emms-source-file-default-directory "~/music/")
        
;; ;; ;; ;; Want to use alsa with mpg321 ? 
;; (setq emms-player-mpg321-parameters '("-o" "alsa"))


;; (require 'emms-player-simple)
;; (require 'emms-source-file)
;; (require 'emms-source-playlist)
;; (setq emms-player-list '(emms-player-mpg321
;;                          emms-player-ogg123
;;                          emms-player-mplayer))
              
;; (require 'emms-info-libtag)
;; (setq emms-info-functions '(emms-info-libtag))



;;;;;;; for quick start
;; (add-to-list 'load-path "~/emacs_settings/emms-3.0/")
;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)
;; ;; Show the current track each time EMMS
;; ;; starts to play a track with "NP : "
;; (add-hook 'emms-player-started-hook 'emms-show)
;; (setq emms-show-format "NP: %s")
;; ;; When asked for emms-play-directory,
;; ;; always start from this one 
;; (setq emms-source-file-default-directory "~/music/")
;; ;; Want to use alsa with mpg321 ? 
;; (setq emms-player-mpg321-parameters '("-o" "alsa"))


;; 다른 유저들의 파일이다 이걸 보고 참고하자.
;; (load-file "~/.emacs.d/de-emms.el")
;; (load-file "~/.emacs.d/lb-emms.el")
;; (load-file "~/emacs_settings/de-emms.el")
;; (load-file "~/emacs_settings/lb-emms.el")




(require 'emms)
;; (require 'emms-setup)
;; (require 'emms-info-libtag)
;; (require 'emms-player-mpg321-remote)


;; (require 'emms)
;; (require 'emms-browser)
;; (require 'emms-cache)
;; (require 'emms-info)
;; (require 'emms-lastfm)
;; (require 'emms-player-mpd)
;; (require 'emms-playing-time)
;; (require 'emms-playlist-mode)
;; (require 'emms-streams)
;; (require 'emms-tag-editor)
;; (require 'emms-volume)


;; (emms-cache 1)
;; (emms-playing-time 1)
;; (emms-lastfm 1)                    ; must come after emms-playing-time


(setq emms-stream-bookmarks-file "~/.emacs.d/emms/emms-streams")
(setq emms-history-file "~/.emacs.d/emms/emms-history")
(setq emms-cache-file "~/.emacs.d/emms/emms-cache")


;;(emms-standard)
;;(emms-devel)
(emms-all)
(emms-default-players)


;; enable emms scoring
;; (setq emms-score-enabled-p t)

;; Start browser with album
;; (setq emms-browser-default-browse-type 'info-album)

;; (setq emms-stream-default-action "play")


;; (require 'emms-mode-line)
;; (emms-mode-line 1)
;; (require 'emms-playing-time)
;; (emms-playing-time 1)

;; (require 'emms-player-simple)
;; (require 'emms-source-file)
;; (require 'emms-source-playlist)
;; (require 'emms-streams)
;; (require 'emms-info)

;; (setq emms-volume-amixer-control "PCM")

(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)


(setq
 emms-info-asynchronously t
 later-do-interval 0.0001
 emms-info-functions '(emms-info-libtag)
 emms-source-file-default-directory "~/Downloads/music"
 emms-mode-line-format " %s "
 emms-show-format "NP: %s")


(setq
 emms-repeat-playlist t
 emms-playlist-buffer-name "emms playlist")



(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))


(setq emms-player-mpg321-parameters '("-o" "alsa"))


(global-set-key (kbd "<kp-subtract>") 'emms-previous)
(global-set-key (kbd "<kp-add>") 'emms-next)
(global-set-key "\C-cen" 'emms-next)
(global-set-key "\C-cep" 'emms-previous)
(global-set-key "\C-cer" 'emms-random)
(global-set-key "\C-ces" 'de-toggle-playing)
(global-set-key (kbd "<insert>") 'de-add-dir)
(global-set-key (kbd "<kp-insert>") 'de-toggle-playing)
(global-set-key (kbd "<f2>") 'emms-smart-browse)
(global-set-key (kbd "<kp-right>") 'emms-seek-forward)
(global-set-key (kbd "<kp-left>") 'emms-seek-backward)

(define-key emms-playlist-mode-map (kbd "/") 'de-search)
(define-key emms-browser-mode-map (kbd "W W") 'emms-browser-lookup-multi)


(add-hook 'emms-playlist-selection-changed-hook 'de-focus-on-track)
(add-hook 'emms-player-started-hook 'emms-show)

;; set up a default cover
;; (setq emms-browser-default-covers
;;       (list "~/emacs_settings/manura.jpg" "~/emacs_settings/manura.jpg" "~/emacs_settings/manura.jpg"))

;; (setq emms-browser-default-covers
;;       (list nil "~/emacs_settings/folder.jpg" nil))

;; (setq emms-browser-default-covers
;;       (list "~/emacs_settings/small.jpg" nil nil))


;;;; 첫번째는 앨범목록에서의 default image
;;;; 두번째는 재생목록에서의 default image
(setq emms-browser-default-covers
      (list "~/emacs_settings/eunseo.jpg" "~/emacs_settings/eunseo.jpg" nil))


;; let compilation tracks be displayed together
(setq emms-browser-get-track-field-function
      'emms-browser-get-track-field-use-directory-name)

;;(setq emms-browser-covers '("Folder.jpg" "front.jpg" "cover.jpg" "folder.jpg" "Front.jpg"))

;;;;실제 emacs상에서 나타나는 것은 두번째인 front.jpg파일을 바꾸어 주면 된다.
;;;;두번째인 front.jpg는 플레이 목록에서의 이미지이다.
;;;;왼쪽 앨범목록이 나올때의 3을 눌러서 level3로 했을때의 이미지는 첫번째이다.
;;;;나머지는 어떨때 쓰는 이미지 인지 모르겠다.
(setq emms-browser-covers '("folder.jpg" "folder.jpg" "folder.jpg" "folder.jpg" "folder.jpg"))

;; (setq emms-browser-info-title-format "%i%cS%n")
;; (setq emms-browser-playlist-info-title-format
;;       emms-browser-info-title-format)
 

;; recenter based on the current track
(defun de-focus-on-track ()
  (let ((w (get-buffer-window emms-playlist-buffer t)))
    (when w
      (with-selected-window w
        (emms-playlist-mode-center-current)
        (recenter '(4))))))

(defun de-toggle-playing ()
  (interactive)
  (if emms-player-playing-p
      (emms-pause)
    (emms-start)))

(defun de-add-dir ()
  (interactive)
  (call-interactively 'emms-add-directory-tree)
  (emms-playlist-mode-go))

(defun de-search ()
  (interactive)
  (goto-char (point-min))
  (call-interactively 'isearch-forward))

(defun emms-browser-lookup-multi ()
  (interactive)
  (emms-browser-lookup-wikipedia 'info-artist)
  (emms-browser-lookup-wikipedia 'info-album)
  (emms-browser-lookup-pitchfork 'info-artist))


;; find /path/to/music/ -iname "*.jpg" -exec convert -resize 100x100 "{}" "{}-emms.jpg" \;

;; (defun my-emms-browser-covers (path size)
;; "Ugly and not lispish, but works."
;;   (let* ((files  (directory-files (file-name-directory path)))
;;          (covr   (catch :found
;;                    (dolist (item files)
;;                      (if (string-match "-emms.jpg$" item)
;;                          (throw :found item))))))
;;     (if covr
;;         (concat (file-name-directory path) covr))))

;; (setq emms-browser-covers 'my-emms-browser-covers)



(provide 'emacs-emms)
;;; emacs-emms.el ends here
