(defpackage #:charm-gui
  (:use #:cl #:charm)
  (:export #:start-game #:start-html-game))

(in-package #:charm-gui)

(defvar *use-gui* nil)

(defun start-game (&optional (num-players 4))
  (start-html-game num-players))

(defun generate-html-gui (hands)
  (with-open-file (out "game.html" :direction :output :if-exists :supersede)
    (princ "<!DOCTYPE html>" out)
    (princ "<html><head><title>Charm Card Game</title>" out)
    (princ "<style>" out)
    (princ "body { font-family: Arial; background: #1a1a2e; color: white; padding: 20px; }" out)
    (princ ".player { margin: 20px 0; padding: 15px; background: #16213e; border-radius: 8px; }" out)
    (princ ".hand { display: flex; gap: 10px; flex-wrap: wrap; }" out)
    (princ ".card { 
      width: 80px; height: 120px; 
      border: 2px solid #fff; 
      border-radius: 8px; 
      display: flex; 
      flex-direction: column; 
      justify-content: center; 
      align-items: center;
      font-weight: bold;
      box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    }" out)
    (princ ".red { background: #e74c3c; }" out)
    (princ ".orange { background: #f39c12; }" out)
    (princ ".yellow { background: #f1c40f; }" out)
    (princ ".green { background: #2ecc71; }" out)
    (princ ".blue { background: #3498db; }" out)
    (princ ".violet { background: #9b59b6; }" out)
    (princ "h2 { margin-top: 0; }" out)
    (princ "</style></head><body>" out)
    (princ "<h1>Charm Card Game</h1>" out)
    
    (loop for i from 0 below (length hands)
          for hand in hands do
      (format out "<div class='player'>~%")
      (format out "<h2>Player ~D</h2>" i)
      (format out "<div class='hand'>")
      (loop for card in hand do
        (format out "<div class='card ~(~A~)'>" (card-color card))
        (format out "<div>~A</div>" (card-number card))
        (format out "</div>"))
      (format out "</div></div>~%"))
    
    (princ "</body></html>" out)))

(defun start-html-game (&optional (num-players 4))
  (let* ((deck (make-deck))
         (hands (deal-cards deck num-players 6)))
    (generate-html-gui hands)))

