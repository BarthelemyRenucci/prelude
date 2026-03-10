;; SQL

(prelude-require-package 'sqlformat)

(setq sqlformat-command 'pgformatter)

(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)
