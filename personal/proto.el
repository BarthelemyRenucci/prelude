;; protobuf

(prelude-require-package 'protobuf-mode)

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
