;;; Misc file

;; Please leave me alone
(setq prelude-guru nil)

;; Dumbjump
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Remove tabs in whitespace
(setq whitespace-tab nil)
