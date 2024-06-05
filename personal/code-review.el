(add-to-list 'load-path "~/.emacs.d/code-review")
(require 'code-review)
(add-hook 'code-review-mode-hook #'emojify-mode)
