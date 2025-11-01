;;; C mode


(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

;; Switch case offset
(c-set-offset 'case-label '+)
