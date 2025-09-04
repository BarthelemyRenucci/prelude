;;; Misc file

;; Please leave me alone
(setq prelude-guru nil)

;; Dumbjump
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Makefile mode for custom extensions
(add-to-list 'auto-mode-alist '("\\Makefile\.[inc]?[docker]?[gen]?[release]?\\'!" . makefile-mode))

;; {{ Makefile mode for custom makefile extensions
(setq auto-mode-alist
      (cons '("\\Makefile\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.inc\\'"     . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.docker\\'"  . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.release\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.gen\\'"     . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.remote\\'"  . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.jlink\\'"   . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.proto\\'"   . protobuf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.changelog\\'"   . protobuf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.remote\\'"   . protobuf-mode) auto-mode-alist))
;; }}


;; Remove tabs in whitespace
(setq whitespace-tab nil)

;; Only use space for align-regexp
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))
