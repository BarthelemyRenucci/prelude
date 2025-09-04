(require 'sql-indent)

(add-hook 'sql-mode-hook
          (lambda () (setq sqlind-minor-mode t)))
