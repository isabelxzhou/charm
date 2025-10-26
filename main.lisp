(defpackage #:charm
  (:use #:cl)
  (:export #:main))

(in-package #:charm)

(defun main ()
  (load "game.lisp")
  (load "gui.lisp")
  (charm-gui:start-html-game 4))

(when (string= (pathname-name *load-pathname*)
               "main")
  (main))

