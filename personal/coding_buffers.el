(require 'transient)

(defun my-setup-buffer-file (buffer-name)
  "Ensure directory '/tmp/emacs/' exists, delete file if present,
and associate the buffer named BUFFER-NAME with its corresponding
file path in '/tmp/emacs/'. Returns the buffer object."
  (let* ((base-dir "/tmp/emacs/")
         (file-path (expand-file-name buffer-name base-dir))
         (buffer (get-buffer-create buffer-name)))
    (unless (file-directory-p base-dir)
      (make-directory base-dir t))
    (when (file-exists-p file-path)
      (delete-file file-path))
    (with-current-buffer buffer
      (set-visited-file-name file-path t))
    buffer))

(defun my-spawn-sql-buffer ()
  "Create and switch to a new buffer named *SQL*, saved under /tmp/emacs/*SQL*, and enable sql-mode."
  (interactive)
  (let ((sql-buffer (my-setup-buffer-file "*SQL*")))
    (switch-to-buffer sql-buffer)
    (sql-mode)
    (message "Switched to %s buffer with sql-mode." (buffer-name sql-buffer))))

(defun my-spawn-python-buffer ()
  "Create and switch to a new buffer named *PythonCode*, enable python-mode,
then split the window and spawn a Python interpreter in the other buffer,
with both buffers saved to '/tmp/emacs/buffer_name'."
  (interactive)
  (let* ((python-code-buffer (my-setup-buffer-file "*PythonCode*")))
    ;; Setup the code buffer in the current window
    (switch-to-buffer python-code-buffer)
    (python-mode)
    (message "Switched to %s buffer with python-mode." (buffer-name python-code-buffer))
    (delete-other-windows)
    (split-window-right)
    (run-python)
    (other-window 1)
    (switch-to-buffer "*Python*")
    (message "Spawned Python interpreter in %s buffer." (buffer-name "*Python*")
    (switch-to-buffer python-code-buffer))))

(defun my-spawn-c-buffer ()
  "Create and switch to a new buffer named *C*, saved under /tmp/emacs/*C*, and enable c-mode."
  (interactive)
  (let ((c-buffer (my-setup-buffer-file "*C*")))
    (switch-to-buffer c-buffer)
    (c-mode)
    (message "Switched to %s buffer with c-mode." (buffer-name c-buffer))))

(transient-define-prefix my-coding-buffers-menu ()
  "A transient menu for spawning coding buffers."
  ["Coding Buffers"
   ("s" "Spawn SQL Buffer" my-spawn-sql-buffer)
   ("p" "Spawn Python Buffer" my-spawn-python-buffer)
   ("c" "Spawn C Buffer" my-spawn-c-buffer)])

(global-set-key (kbd "C-c m") 'my-coding-buffers-menu)
