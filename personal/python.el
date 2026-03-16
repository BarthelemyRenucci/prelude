;;; Python

(prelude-require-packages '(apheleia python-pytest toml-mode uv-mode))

(require 'company)
(require 'flycheck)

(use-package apheleia
  :demand t
  :config
  (setf (alist-get 'ruff apheleia-formatters)
        '("sh" "-c" "uvx ruff check --fix --force-exclude --exit-zero --stdin-filename \"$1\" - | uvx ruff format --stdin-filename \"$1\" -" "--" filepath))
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff)
  (apheleia-global-mode +1))

(defun my/python-mode-hook ()
  ;; Ensure flycheck is active
  (flycheck-mode +1)
  ;; Use ruff as the default checker
  (setq-local flycheck-checker 'python-ruff))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(use-package uv-mode
  :hook (python-mode . uv-mode-auto-activate-hook))

(use-package python-pytest
  :bind (("C-c x" . python-pytest-dispatch))
  :custom
  (python-pytest-confirm t))
