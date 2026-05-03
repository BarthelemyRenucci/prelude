;;; C/C++ LSP setup

(setq lsp-keymap-prefix "C-c C-l")
(setq lsp-enable-indentation nil)
(setq lsp-enable-on-type-formatting nil)

(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'objc-mode-hook #'lsp)
