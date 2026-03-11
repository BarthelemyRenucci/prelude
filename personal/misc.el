;;; Misc file

;; Please leave me alone
(setq prelude-guru nil)

;; Dumbjump
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Makefile mode for custom makefile extensions
(add-to-list 'auto-mode-alist '("\\Makefile\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'"     . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.docker\\'"  . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.release\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.gen\\'"     . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.remote\\'"  . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.jlink\\'"   . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.proto\\'"      . protobuf-mode))
(add-to-list 'auto-mode-alist '("\\.changelog\\'"  . protobuf-mode))

;; Only use space for align-regexp
(advice-add 'align-regexp :around
            (lambda (orig-fn &rest args)
              (let ((indent-tabs-mode nil))
                (apply orig-fn args))))

;; Disable autosave in specific repository
(defun my-disable-autosave-in-birota-repo ()
  (when (and buffer-file-name
             (file-in-directory-p buffer-file-name
                                  (expand-file-name "~/birota-repo/mounted_repo/")))
    (auto-save-mode -1)))

(add-hook 'find-file-hook 'my-disable-autosave-in-birota-repo)
