;;; Keybindings

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Some custom project jump
(global-set-key (kbd "C-x ²")
                (lambda()
                  (interactive)
                  (dired "~/.emacs.d")))

(global-set-key (kbd "C-x C-²")
                (lambda()
                  (interactive)
                  (dired "~/misc")))

(global-set-key (kbd "C-x &")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware")))

(global-set-key (kbd "C-x C-&")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo")))

(global-set-key (kbd "C-x é")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/modules")))

(global-set-key (kbd "C-x \"")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/project")))

(global-set-key (kbd "C-x C-\"")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/project/edock01-main")))


(global-set-key (kbd "C-x '")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/modules/includes")))

(global-set-key (kbd "C-x (")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/tools")))

(global-set-key (kbd "C-x C-(")
                (lambda()
                  (interactive)
                  (dired "/home/bart/birota-repo/embedded-rd-logs-viewer/")))

(global-set-key (kbd "C-x -")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/external")))

(global-set-key (kbd "C-x è")
                (lambda()
                  (interactive)
                  (find-file "~/.organistation.org")))

(global-set-key (kbd "C-x C-è")
                (lambda()
                  (interactive)
                  (find-file "~/.scratch.txt")))

(global-set-key (kbd "M-n") 'swiper-thing-at-point)

(global-set-key (kbd "C-c g") (lambda () (interactive) (shell-command "git submodule update --init --recursive &")))

(global-set-key (kbd "C-M-y") (lambda() (interactive) (browse-kill-ring)))

(global-set-key (kbd "M-g M-g") 'avy-goto-line)

(global-set-key (kbd "C-c v") 'avy-goto-char-timer)
