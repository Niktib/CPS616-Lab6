; This is a test program
; You should create other programs to test your parser
(defun (fact x)
  (if (= x 0) 1
    (* x (fact (- x 1)))))
