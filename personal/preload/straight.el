;; Straight
;; Code from https://github.com/radian-software/straight.el?tab=readme-ov-file#bootstrapping-straightel


;; Suppress the coexistence warning: Prelude uses package.el for most packages
;; and straight.el only for packages not on MELPA (e.g. claude-code-ide.el).
;; Pre-defining the guard variable prevents the warning before bootstrap runs.
(defvar straight-package--warning-displayed t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
