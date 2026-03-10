;;; Python

(prelude-require-packages '(apheleia company-jedi python-pytest toml-mode))

(require 'company)
(require 'flycheck)

(use-package apheleia
  :demand t
  :config
  (setf (alist-get 'ruff apheleia-formatters)
        '("sh" "-c" "ruff check --fix --force-exclude --exit-zero --stdin-filename \"$1\" - | ruff format --stdin-filename \"$1\" -" "--" filepath))
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff)
  (apheleia-global-mode +1))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  ;; Ensure flycheck is active
  (flycheck-mode +1)
  ;; Use ruff as the default checker
  (setq-local flycheck-checker 'python-ruff))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(use-package python-pytest
  :bind (("C-c x" . python-pytest-dispatch))
  :custom
  (python-pytest-confirm t))
