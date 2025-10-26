(defpackage #:charm
  (:use #:cl)
  (:export #:card #:make-card #:card-number #:card-color
           #:deck #:make-deck #:shuffle-deck
           #:deal-cards #:player-hand #:test-game))

(in-package #:charm)

(defstruct card
  (number 0 :type (integer 0 6))
  (color "" :type string))

(defparameter *colors* '("red" "orange" "yellow" "green" "blue" "violet"))

(defun make-deck ()
  (let ((deck nil))
    (loop for num from 1 to 6 do
      (loop for color in *colors* do
        (push (make-card :number num :color color) deck)))
    deck))

(defun shuffle-deck (deck)
  (let ((array (coerce deck 'vector))
        (n (length deck)))
    (loop for i from (- n 1) downto 1 do
      (let ((j (random (+ i 1))))
        (rotatef (aref array i) (aref array j))))
    (coerce array 'list)))

(defun deal-cards (deck num-players cards-per-player)
  (let ((shuffled-deck (shuffle-deck deck))
        (hands '()))
    (loop for p from 0 below num-players do
      (let ((hand '()))
        (loop for i from 0 below cards-per-player do
          (when shuffled-deck
            (push (pop shuffled-deck) hand)))
        (push hand hands)))
    (nreverse hands)))

(defun card-to-string (card)
  (format nil "~A ~A" (card-color card) (card-number card)))

(defun display-player-hand (hand player-number)
  (format t "Player ~D hand: " player-number)
  (format t "~{~A~^, ~}~%" (mapcar #'card-to-string hand)))

(defun test-game ()
  (let ((deck (make-deck))
        (hands (deal-cards deck 4 6)))
    (loop for i from 0 below (length hands) do
      (display-player-hand (nth i hands) i))))

