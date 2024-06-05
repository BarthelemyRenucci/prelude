;;; Magit configuration

(prelude-require-package 'forge)

(setq magit-section-initial-visibility-alist '((unpushed . show) (unstaged . show) (staged . show) (untracked . hide) (stashes . hide)))

;; Magit d for both ediff
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))

;; Forge setup]

(with-eval-after-load 'magit
  (require 'forge))
(setq auth-sources '("~/.authinfo.gpg"))
