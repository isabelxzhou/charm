(defpackage #:charm
  (:use #:cl)
  (:export #:main))

(in-package #:charm)

(defun main ()
  (handler-bind ((warning #'muffle-warning))
    (load "game.lisp")
    (load "gui.lisp")
    (funcall (find-symbol "START-HTML-GAME" :charm-gui) 4)))

(when (string= (pathname-name *load-pathname*)
               "main")
  (main))

