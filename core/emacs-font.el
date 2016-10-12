;;; emacs-font.el --- emacs-font configuration
;;; Copyright (C) 2016 by KudzuValley



;; ************************************************************
;;        F O N T S   S E T T I N G   M O D E
;; ************************************************************
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                  '("NanumGothicOTF" . "iso10646-1"))
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
                  '("NanumGothicOTF" . "iso10646-1"))
(set-fontset-font "fontset-default" 'kana
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'han
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'japanese-jisx0208
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
(set-fontset-font "fontset-default" 'katakana-jisx0201
                  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))



(when (eq system-type 'gnu/linux)
  ;; default Latin font (e.g. Consolas)
  ;; but I use Monaco 
  (set-face-attribute 'default nil :family "Consolas")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 130)
  ;;(set-face-attribute 'default nil :weight 'bold)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;;(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  ;;(set-fontset-font t 'hangul (font-spec :name "나눔바른고딕" :size 20))
  (set-fontset-font t 'hangul (font-spec :name "나눔바른고딕"))
  ;; you may want to add different for other charset in this way.
  )

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; but I use Monaco
  (message "MAC System")
  (set-face-attribute 'default nil :family "Monaco")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 130)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

  ;; you may want to add different for other charset in this way.
  )

;;; org 에서 한글 테이블 깨지지 않기 위해서 쓴다.  높이 비율로 크기를
;;; 맞춰야 하는데 'Monaco' 크기가 (:height)가 130 일때 'Nanum Gothic'
;;; 은 size 가 17 , 'NanumGothicCoding' 은 size 가 16 이어야지 비율이
;;; 맞습니다. 실제로 적용은 face-font-rescale-alist 변수를 이용해서
;;; 적용해 줍니다.
;; (setq face-font-rescale-alist
;;       '((".*hiragino.*" . 1.2)
;;         ("NanumGothicCoding" . 1.2307692307692308)))





(provide 'emacs-font)
;;; emacs-font.el ends here
