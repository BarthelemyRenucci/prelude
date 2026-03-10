(with-eval-after-load 'makefile
  (with-eval-after-load 'swiper
    (define-key makefile-mode-map (kbd "M-n") 'swiper-thing-at-point)))
