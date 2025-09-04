;; Ellama

(prelude-require-packages '(ellama))

(use-package ellama
  :ensure t
  :bind ("C-c M-e" . ellama)
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message)
  :init
  (setopt ellama-auto-scroll t)
  ;; setup key bindings
  (require 'llm-ollama)
  (setopt ellama-provider

          ;; (make-llm-ollama
          ;;  :host "192.168.0.214"
          ;;  :port 5151
          ;;  :chat-model "qwen2.5-coder:7b"
  	      ;;  :embedding-model "nomic-embed-text:latest"
  	      ;;  :default-chat-non-standard-params '(("num_ctx" . 32768) ("temp" . 0.2) ("stop" . ("# ")) ("stop" . ("def "))  ("stop" . ("class "))))

          (make-llm-ollama
           :host "0.0.0.0"
           :port 11434
           :chat-model "qwen3:1.7b"
  	       :embedding-model "nomic-embed-text:latest"
  	       :default-chat-non-standard-params '(("temp" . 0.2) ("stop" . ("# ")) ("stop" . ("def "))  ("stop" . ("class "))))
          )
  )
