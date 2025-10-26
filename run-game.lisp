#!/usr/bin/env sbcl --script

(handler-bind ((warning #'muffle-warning))
  (load "game.lisp")
  (load "gui.lisp")
  (funcall (find-symbol "START-HTML-GAME" :charm-gui) 4))

