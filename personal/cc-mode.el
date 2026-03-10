;;; C mode


(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (when (fboundp 'apheleia-mode)
              (apheleia-mode -1))))

;; Switch case offset
(c-set-offset 'case-label '+)
