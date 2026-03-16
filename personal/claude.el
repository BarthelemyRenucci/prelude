;; Claude code

(prelude-require-package 'vterm)

(use-package claude-code-ide
  :straight (:type git :host github :repo "manzaltu/claude-code-ide.el")
  :bind ("C-c z" . claude-code-ide-menu)
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools
