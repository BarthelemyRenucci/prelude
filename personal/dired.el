;;; Dired custom

(defun dired-mode-hook-setup ()
  (dired-hide-details-mode 1)
  (local-set-key  "/" 'dired-isearch-filenames)
  (local-set-key  "e" 'my-ediff-files))
(add-hook 'dired-mode-hook 'dired-mode-hook-setup)

;; when there is two dired buffer, Emacs will select another buffer
;; as target buffer (target for copying files, for example).
;; It's similar to windows commander.
(setq dired-dwim-target t)
