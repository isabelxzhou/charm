(ql:quickload :usocket)
(ql:quickload :bordeaux-threads)

(defpackage :charm-server
  (:use :cl :usocket :bordeaux-threads))
(in-package :charm-server)

(defparameter *port* 4000)

(defun handle-client (stream)
  (unwind-protect
       (loop for line = (read-line stream nil nil)
             while line do
               (format t "Got: ~A~%" line)
               (format stream "Echo: ~A~%" line)
               (finish-output stream))
    (close stream)))

(defun start-server ()
  (let ((server (socket-listen "127.0.0.1" *port* :reuse-address t)))
    (format t "Listening on port ~A~%" *port*)
    (bt:make-thread
     (lambda ()
       (loop
         (multiple-value-bind (client-socket stream)
             (socket-accept server)
           (bt:make-thread
            (lambda () (handle-client stream)))))))
    server))
