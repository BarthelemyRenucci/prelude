(defun my-split-window-horizontally (&optional ratio)
  "Split window horizontally and resize the new window.
'C-u number M-x my-split-window-horizontally' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-horizontally (floor (/ (window-body-width)
                                           (1+ ratio-val)))))
     (t
      (split-window-horizontally)))
    (set-window-buffer (next-window) (current-buffer))
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-right))))


(defun my-split-window-vertically (&optional ratio)
  "Split window vertically and resize the new window.
'C-u number M-x my-split-window-vertically' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio my-ratio-dict)))
      (split-window-vertically (floor (/ (window-body-height)
                                         (1+ ratio-val)))))
     (t
      (split-window-vertically)))
    ;; open another window with current-buffer
    (set-window-buffer (next-window) (current-buffer))
    ;; move focus if new window bigger than current one
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-down))))

(global-set-key (kbd "C-x 2") 'my-split-window-vertically)
(global-set-key (kbd "C-x 3") 'my-split-window-horizontally)
