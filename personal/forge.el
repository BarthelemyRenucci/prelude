(require 'forge)
(require 'transient)

(defun forge-slack--run-script (url)
  "Run the shell command 'slack_message' with the given URL and message."
  (let* ((message-part " svp :prayge:")
         (full-arg (concat url message-part))
         (cmd (format "source ~/.zshrc; slack_message %s" (shell-quote-argument full-arg))))

    (start-process-shell-command
     "forge-slack" "*forge-slack*" cmd)

    (message "Running Slack script for: %s" url)))

(defun forge-slack-send-pr (pull-request)
  (interactive
   (list (forge-read-pullreq "Send PR URL to Slack")))
  (let* ((topic (forge-get-pullreq pull-request))
         (url (and topic (forge-get-url topic))))

    (if url
        (forge-slack--run-script url)
      (error "Could not get URL for pull request %s" pull-request))))

(defconst my-forge-slack-group
  ["Slack"
   ("s p" "Send pull request" forge-slack-send-pr)]
  "New group for Slack actions in the Forge transient.")

(with-eval-after-load 'forge
  (transient-append-suffix 'forge-dispatch '() my-forge-slack-group))
