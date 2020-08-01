(require 'go-mode)
(require 'compile)
(require 'time-stamp)

(defgroup go-playground nil
  "Options specific to Go Playground."
  :group 'go)

(defcustom go-playground-ask-file-name nil
  "Non-nil means we ask for a name for the snippet.
By default it will be created as snippet.go"
  :type 'boolean
  :group 'go-playground)

(defcustom go-playground-go-command-args "run snippet.go"
  "The arguments that passed to `go` compiler.`"
  :type 'string
  :group 'go-playground)

(defcustom go-playground-basedir "~/go/src/playground"
  "Base directory for playground snippets.  Better to set it under GOPATH."
  :type 'file
  :group 'go-playground)

(define-minor-mode go-playground-mode
  "A place for playing with golang code."
  :init-value nil
  :lighter "Play(Go)"
  :keymap '(([C-return] . go-playground-exec)))

(defun go-playground()
  "Playgoround for Golang in Emacs"
  (interactive)
  (let ((snippet-filename (go-playground-snippet-filename)))
        (switch-to-buffer (create-file-buffer snippet-filename))
        (insert "package main

import (
    \"fmt\"
)

func main() {
    fmt.Println(\"Hello\")
}
")
        (backward-char 3)
        (go-mode)
        (go-playground-mode)
        (set-visited-file-name snippet-filename t)))

(defun go-playground-snippet-filename ()
  "Returns a timestamp with extension .go to use as a file name"
  (let ((file-name "snippet"))
    (concat (go-playground-snippet-unique-dir) "/" file-name ".go")))

(defun go-playground-snippet-unique-dir ()
  "Get unique directory under GOPATH/`go-playground-basedir`."
  (let ((dir-name (concat go-playground-basedir "/"
                          (time-stamp-string "%:y-%02m-%02d-%02H%02M%02S"))))
    (make-directory dir-name t)
    dir-name))

(defun go-playground-exec ()
  "Save the buffer then runs Go compiler for executing the code."
  (interactive)
  (if (go-playground-inside)
      (progn
        (save-buffer t)
        (make-local-variable 'compile-command)
        (compile (concat go-command " " go-playground-go-command-args)))))

(defun go-playground-inside ()
  "Is the current buffer is valid go-playground buffer."
  (if (string-match-p (file-truename go-playground-basedir) (file-truename (buffer-file-name)))
	  (bound-and-true-p go-playground-mode)))

(provide 'go-playground)

