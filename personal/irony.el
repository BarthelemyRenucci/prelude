;;; Irony mode

(prelude-require-packages '(irony company-irony flycheck-irony company-c-headers))


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-c-headers)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
