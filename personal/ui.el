;; This file setup a minimalist UI


(prelude-require-packages '(zone nyan-mode beacon))

;; Increase line limit
(setq whitespace-line-column 250) ;; limit line length

;; Disable highlight mode
(global-hl-line-mode -1)

;; Display time
(display-time-mode 1)

;; Disable whitespace
(setq prelude-whitespace nil)

;; Add beacon
(beacon-mode 1)

;; Turn off menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Zone when idle
(require 'zone)
(zone-when-idle 120)

;; Set fullscreen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 95)


;; Add nyan-cat
(require 'nyan-mode)
(setq nyan-mode t)
(setq nyan-animate-nyancat t)
(nyan-start-animation)
