;; This file setup a minimalist UI


(prelude-require-packages '(zone nyan-mode beacon ligature))

;; Increase line limit
(setq whitespace-line-column 250) ;; limit line length

;; Disable highlight mode
(global-hl-line-mode -1)

;; Display time
(display-time-mode 1)


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
(setq initial-frame-alist '((fullscreen . maximized)))

;; Set transparency of emacs

(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))


;; Add nyan-cat
(require 'nyan-mode)
(nyan-mode 1)
(setq nyan-animate-nyancat t)
(nyan-start-animation)

;; Enable ligature in major modes for Fira Code
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Ret-11"))

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)
