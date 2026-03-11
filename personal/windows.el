(defun my-split-window-horizontally (&optional ratio)
  "Split window horizontally and resize the new window.
'C-u number M-x my-split-window-horizontally' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* ((ratio-val (and ratio (cdr (assoc ratio my-ratio-dict)))))
    (if ratio-val
        (split-window-horizontally (floor (/ (window-body-width)
                                             (1+ ratio-val))))
      (split-window-horizontally))
    (set-window-buffer (next-window) (current-buffer))
    (when (or (not ratio-val)
              (>= ratio-val 1))
      (windmove-right))))


(defun my-split-window-vertically (&optional ratio)
  "Split window vertically and resize the new window.
'C-u number M-x my-split-window-vertically' uses pre-defined
ratio from `my-ratio-dict'.
Always focus on bigger window."
  (interactive "P")
  (let* ((ratio-val (and ratio (cdr (assoc ratio my-ratio-dict)))))
    (if ratio-val
        (split-window-vertically (floor (/ (window-body-height)
                                           (1+ ratio-val))))
      (split-window-vertically))
    (set-window-buffer (next-window) (current-buffer))
    (when (or (not ratio-val)
              (>= ratio-val 1))
      (windmove-down))))

(keymap-global-set "C-x 2" #'my-split-window-vertically)
(keymap-global-set "C-x 3" #'my-split-window-horizontally)
