;;; Python

(prelude-require-package 'python-black)

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))
