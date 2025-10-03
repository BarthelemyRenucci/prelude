(prelude-require-package 'aidermacs)

(use-package aidermacs
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  (setenv "OLLAMA_API_BASE" "http://192.168.0.214:5151")
  ;;:custom
  )

(setq aidermacs-config-file "~/.aider.conf.yml")
