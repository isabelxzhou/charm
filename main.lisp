(defpackage #:charm
  (:use #:cl)
  (:export #:main))

(in-package #:charm)

(defun main ()
  "Entry point for the Charm game."
  (format t "Welcome to Charm!~%")
  (format t "Game starting...~%")
  ; Game logic goes here
  )

; For running the game
(when (string= (pathname-name *load-pathname*)
               "main")
  (main))

