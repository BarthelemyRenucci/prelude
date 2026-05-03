;;; Magit configuration

(prelude-require-package 'forge)

(setq magit-section-initial-visibility-alist '((unpushed . show) (unstaged . show) (staged . show) (untracked . hide) (stashes . hide)))
;; Only cache visibility for sections we want to hide by default, so manual
;; collapse of unstaged/staged/unpushed sections doesn't persist across refreshes.
(setq magit-section-cache-visibility '(untracked stashes))

;; Magit d for both ediff

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map ()
  "Add 'd' binding in ediff to copy both regions A and B to C."
  (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook #'add-d-to-ediff-mode-map)

;; Forge setup]

(with-eval-after-load 'magit
  (require 'forge))
(setq auth-sources '("~/.authinfo.gpg"))
