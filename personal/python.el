;;; Python

(prelude-require-packages '(apheleia python-pytest toml-mode uv-mode lsp-pyright))

(require 'company)
(require 'flycheck)

;; Apheleia: ruff format-on-save, but don't auto-fix unused imports (F401)
(use-package apheleia
  :demand t
  :config
  (setf (alist-get 'ruff apheleia-formatters)
        '("sh" "-c" "uvx ruff check --fix --unfixable F401 --force-exclude --exit-zero --stdin-filename \"$1\" - | uvx ruff format --stdin-filename \"$1\" -" "--" filepath))
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff)
  (apheleia-global-mode +1))

;; LSP via basedpyright for auto-import, navigation, and completion
(use-package lsp-pyright
  :demand t
  :custom
  (lsp-pyright-langserver-command "basedpyright")
  (lsp-pyright-auto-import-completions t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(setq lsp-completion-provider :capf)

(defun my/python-mode-hook ()
  (flycheck-mode +1)
  (setq-local flycheck-checker 'python-ruff)
  ;; Disable anaconda since pyright handles completion/navigation/eldoc
  (anaconda-mode -1)
  (setq-local company-backends '(company-capf :with company-yasnippet)))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Manual ruff fix-all (including unused imports) for pre-commit cleanup
(defun my/python-ruff-fix-all ()
  "Run full ruff check --fix including unused import removal."
  (interactive)
  (let ((file (buffer-file-name)))
    (when file
      (save-buffer)
      (shell-command (format "uvx ruff check --fix --force-exclude %s"
                             (shell-quote-argument file)))
      (revert-buffer t t t))))

(with-eval-after-load 'python
  (define-key python-mode-map (kbd "C-c r f") #'my/python-ruff-fix-all)
  (define-key python-mode-map (kbd "C-c l r") #'lsp-restart-workspace))

(use-package uv-mode
  :hook (python-mode . uv-mode-auto-activate-hook))

(use-package python-pytest
  :bind (("C-c x" . python-pytest-dispatch))
  :custom
  (python-pytest-confirm t))
