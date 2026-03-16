;;; Irony mode

(prelude-require-packages '(irony company-irony flycheck-irony company-c-headers))

;; MELPA packages use "Package-Version:" instead of "Version:", which breaks
;; irony-install-server's cmake build. Fix by creating a patched source tree.
(defun my/irony-prepare-server-source ()
  "Create a patched irony server source dir with a proper Version: header.
MELPA strips the Version: header and replaces it with Package-Version:,
but irony's CMakeLists.txt requires Version: to exist in irony.el."
  (let* ((irony-el (find-library-name "irony"))
         (irony-dir (file-name-directory irony-el))
         (server-dir (expand-file-name "server" irony-dir))
         (patched-dir (expand-file-name "irony-server-patched" user-emacs-directory))
         (patched-irony-el (expand-file-name "irony.el" patched-dir))
         (patched-server (expand-file-name "server" patched-dir)))
    (make-directory patched-dir t)
    (when (file-symlink-p patched-server)
      (delete-file patched-server))
    (make-symbolic-link server-dir patched-server t)
    (with-temp-file patched-irony-el
      (insert-file-contents irony-el)
      (goto-char (point-min))
      (when (re-search-forward "^;; Package-Version: \\(.*\\)" nil t)
        (let ((ver (match-string 1)))
          (beginning-of-line)
          (insert (format ";; Version: %s\n" ver)))))
    patched-dir))

(with-eval-after-load 'irony
  (setq irony-server-source-dir
        (expand-file-name "server" (my/irony-prepare-server-source)))
  ;; irony-version uses lm-version which requires "Version:" header.
  ;; MELPA only provides "Package-Version:", so advise it to fall back.
  (advice-add 'irony-version :around
              (lambda (orig &optional show-version)
                (let ((v (funcall orig show-version)))
                  (or v
                      (with-temp-buffer
                        (insert-file-contents (find-library-name "irony"))
                        (goto-char (point-min))
                        (when (re-search-forward "^;; Package-Version: \\(.*\\)" nil t)
                          (match-string 1))))))))

(add-hook 'c++-mode-hook #'irony-mode)
(add-hook 'c-mode-hook #'irony-mode)
(add-hook 'objc-mode-hook #'irony-mode)

(add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)

(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-c-headers)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
