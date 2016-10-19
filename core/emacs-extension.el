;;; emacs-extension.el --- emacs-extension configuration
;;; Copyright (C) 2016 by KudzuValley

;;************************************************************
;;         F I L E    E X T E N S I O N S       
;;************************************************************
;;파일 확장자에 해당하는 mode 설정을 한다.
(setq auto-mode-alist
      '(("\\.[Cc][Oo][Mm]\\'" . text-mode)
        ("\\.bat\\'" . bat-generic-mode)
        ("\\.inf\\'" . inf-generic-mode)
        ("\\.rc\\'" . rc-generic-mode)
        ("\\.reg\\'" . reg-generic-mode)
        ("\\.cob\\'" . cobol-mode)
        ("\\.cbl\\'" . cobol-mode)
        ("\\.te?xt\\'" . text-mode)
        ("\\.c\\'" . c-mode)
        ("\\.h\\'" . c++-mode)
        ("\\.tex$" . LaTeX-mode)
        ("\\.sty$" . LaTeX-mode)
        ("\\.bbl$" . LaTeX-mode)
        ("\\.bib$" . BibTeX-mode)
        ("\\.el\\'" . emacs-lisp-mode)
        ("\\.scm\\'" . scheme-mode)
        ("\\.l\\'" . lisp-mode)
        ("\\.lisp\\'" . lisp-mode)
        ("\\.f\\'" . fortran-mode)
        ("\\.F\\'" . fortran-mode)
        ("\\.for\\'" . fortran-mode)
        ("\\.p\\'" . pascal-mode)
        ("\\.pas\\'" . pascal-mode)
        ("\\.ad[abs]\\'" . ada-mode)
        ("\\.\\([pP][Llm]\\|al\\)\\'" . perl-mode)
	("\\.cgi$"  . perl-mode)
        ("\\.s?html?\\'" . sgml-mode)
        ("\\.idl\\'" . c++-mode)
        ("\\.cc\\'" . c++-mode)
        ("\\.hh\\'" . c++-mode)
        ("\\.hpp\\'" . c++-mode)
        ("\\.C\\'" . c++-mode)
        ("\\.H\\'" . c++-mode)
        ("\\.cpp\\'" . c++-mode)
        ("\\.[cC][xX][xX]\\'" . c++-mode)
        ("\\.hxx\\'" . c++-mode)
        ("\\.c\\+\\+\\'" . c++-mode)
        ("\\.h\\+\\+\\'" . c++-mode)
        ("\\.m\\'" . objc-mode)
        ("\\.java\\'" . java-mode)
        ("\\.ma?k\\'" . makefile-mode)
        ("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?" . makefile-mode)
        ("\\.am\\'" . makefile-mode)
        ("\\.mms\\'" . makefile-mode)
        ("\\.texinfo\\'" . texinfo-mode)
        ("\\.te?xi\\'" . texinfo-mode)
        ("\\.s\\'" . asm-mode)
        ("\\.S\\'" . asm-mode)
        ("\\.asm\\'" . asm-mode)
        ("ChangeLog\\'" . change-log-mode)
        ("change\\.log\\'" . change-log-mode)
        ("changelo\\'" . change-log-mode)
        ("ChangeLog\\.[0-9]+\\'" . change-log-mode)
        ("changelog\\'" . change-log-mode)
        ("changelog\\.[0-9]+\\'" . change-log-mode)
        ("\\$CHANGE_LOG\\$\\.TXT" . change-log-mode)
        ("\\.scm\\.[0-9]*\\'" . scheme-mode)
        ("\\.[ck]?sh\\'\\|\\.shar\\'\\|/\\.z?profile\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\(bash_profile\\|z?login\\|bash_login\\|z?logout\\)\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\(bash_logout\\|[kz]shrc\\|bashrc\\|t?cshrc\\|esrc\\)\\'" . sh-mode)
        ("\\(/\\|\\`\\)\\.\\([kz]shenv\\|xinitrc\\|startxrc\\|xsession\\)\\'" . sh-mode)
        ("\\.lst\\'" . sh-mode)     ;;lim edit
        ("\\.list\\'" . sh-mode)     ;;lim edit
        ("\\.mm\\'" . nroff-mode)
        ("\\.me\\'" . nroff-mode)
        ("\\.ms\\'" . nroff-mode)
        ("\\.man\\'" . nroff-mode)
        ("\\.[12345678]\\'" . nroff-mode)
        ("\\.TeX\\'" . TeX-mode)
        ("\\.sty\\'" . LaTeX-mode)
        ("\\.cls\\'" . LaTeX-mode)
        ("\\.clo\\'" . LaTeX-mode)
        ("\\.bbl\\'" . LaTeX-mode)
        ("\\.bib\\'" . BibTeX-mode)
        ("\\.m4\\'" . m4-mode)
        ("\\.mc\\'" . m4-mode)
        ("\\.mf\\'" . metafont-mode)
        ("\\.mp\\'" . metapost-mode)
        ("\\.vhdl?\\'" . vhdl-mode)
        ("\\.article\\'" . text-mode)
        ("\\.letter\\'" . text-mode)
        ("\\.tcl\\'" . tcl-mode)
        ("\\.exp\\'" . tcl-mode)
        ("\\.itcl\\'" . tcl-mode)
        ("\\.itk\\'" . tcl-mode)
        ("\\.icn\\'" . icon-mode)
        ("\\.sim\\'" . simula-mode)
        ("\\.mss\\'" . scribe-mode)
        ("\\.f90\\'" . f90-mode)
        ("\\.lsp\\'" . lisp-mode)
        ("\\.awk\\'" . awk-mode)
        ("\\.prolog\\'" . prolog-mode)
        ("\\.tar\\'" . tar-mode)
        ("\\.\\(arc\\|zip\\|lzh\\|zoo\\|jar\\)\\'" . archive-mode)
        ("\\.\\(ARC\\|ZIP\\|LZH\\|ZOO\\|JAR\\)\\'" . archive-mode)
        ("\\`/tmp/Re" . text-mode)
        ("/Message[0-9]*\\'" . text-mode)
        ("/drafts/[0-9]+\\'" . mh-letter-mode)
        ("\\.zone\\'" . zone-mode)
        ("\\`/tmp/fol/" . text-mode)
        ("\\.y\\'" . c-mode)
        ("\\.lex\\'" . c-mode)
        ("\\.oak\\'" . scheme-mode)
        ("\\.sgml?\\'" . sgml-mode)
        ("\\.xml\\'" . sgml-mode)
        ("\\.dtd\\'" . sgml-mode)
        ("\\.ds\\(ss\\)?l\\'" . dsssl-mode)
        ("\\.idl\\'" . c++-mode)
        ("[]>:/\\]\\..*emacs\\'" . emacs-lisp-mode)
        ("\\`\\..*emacs\\'" . emacs-lisp-mode)
        ("[:/]_emacs\\'" . emacs-lisp-mode)
        ("\\.ml\\'" . lisp-mode)))

(setq auto-mode-alist
      (append '(("\\.C$"   . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.cc$"  . c++-mode)
                ("\\.hh$"  . c++-mode)
                ("\\.c$"   . c-mode)
                ("\\.h$"   . c-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.mak"  . makefile-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.php$"  . php-mode))
              auto-mode-alist))


(setq auto-mode-alist
      (append '(("\\.conf$"  . sh-mode)
                ("\\-custom$". sh-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.sql$"  . sql-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.ac$"  . conf-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.bashrc$"  . sh-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.org$"  . org-mode))
              auto-mode-alist))


(setq auto-mode-alist
      (append '(("\\.as$"  . actionscript-mode))
              auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.patch$"  . diff-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.diff$"  . diff-mode))
              auto-mode-alist))




(add-to-list 'auto-mode-alist '("\\.include$" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.lib$" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.build$" . makefile-mode))


(provide 'emacs-extension)
;;; emacs-extension.el ends here
