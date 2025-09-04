;;; Keybindings

;; Magit
(keymap-global-set "C-x g" 'magit-status)

;; Some custom project jump
(keymap-global-set "C-x ²"
                   (lambda()
                     (interactive)
                     (dired "~/.emacs.d")))

(keymap-global-set "C-x C-²"
                   (lambda()
                     (interactive)
                     (dired "~/misc")))

(keymap-global-set "C-x &"
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware")))

(keymap-global-set "C-x C-&"
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo")))

(keymap-global-set "C-x é"
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/modules")))

(keymap-global-set "C-x \""
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/project")))

(keymap-global-set "C-x C-\""
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/project/edock01-main")))


(keymap-global-set "C-x '"
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/modules/includes")))

(keymap-global-set "C-x ("
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/tools")))

(keymap-global-set "C-x C-("
                   (lambda()
                     (interactive)
                     (dired "/home/bart/birota-repo/embedded-traces-post-processing/scripts")))

(keymap-global-set "C-x -"
                   (lambda()
                     (interactive)
                     (dired "~/birota-repo/embedded-firmware/external")))

(keymap-global-set "C-x è"
                   (lambda()
                     (interactive)
                     (find-file "~/.organistation.org")))

(keymap-global-set "C-x C-è"
                   (lambda()
                     (interactive)
                     (find-file "~/.scratch.txt")))

(keymap-global-set "C-x M-r"
                   (lambda()
                     (interactive)
                     (shell-command "/home/bart/birota-repo/embedded-firmware/tools/changelog/resolve_conflict.sh origin/master 1")))


(global-set-key (kbd "M-n") 'swiper-thing-at-point)

(global-set-key (kbd "C-c g") (lambda () (interactive) (shell-command "git submodule update --init --recursive &")))

;; (global-set-key (kbd "C-M-y") (lambda() (interactive) (browse-kill-ring)))

(global-set-key (kbd "M-g M-g") 'avy-goto-line)

(global-set-key (kbd "C-c v") 'avy-goto-char-timer)

;; Key-chord

(key-chord-define-global "aa" 'ag)
(key-chord-define-global "jj" 'avy-goto-char-timer)
(key-chord-define-global "kk" 'avy-goto-line)
(key-chord-define-global "ii" 'magit-blame-addition)
(key-chord-define-global "qq" 'code-review-forge-pr-at-point)
