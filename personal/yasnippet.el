;;; YASnippet

(prelude-require-package 'yasnippet)

(add-to-list 'load-path
             "~/.emacs.d/plugins/snippets")
(require 'yasnippet)
(yas-reload-all)
(add-hook 'c-mode-hook #'yas-minor-mode)
