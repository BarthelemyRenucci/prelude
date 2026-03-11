;;; Modeline file

(prelude-require-packages '(doom-modeline nerd-icons nerd-icons-dired))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-column-zero-based nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-workspace-name nil)
  (doom-modeline-lsp nil)
  (doom-modeline-gnus nil)
  (doom-modeline-irc nil))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))
