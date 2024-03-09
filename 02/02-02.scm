(define (make-point x y) (cons x y))
(define (x-point point) (car point)) 
(define (y-point point) (cdr point))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment)) 
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (let ((mid-x (average (x-point (start-segment segment)) (x-point (end-segment segment))))
		(mid-y (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

	(make-point mid-x mid-y)))

(define (average a b) (/ (+ a b) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")))


(define segment1 (make-segment (make-point 0 2) (make-point 6 2)))
(print-point (midpoint-segment segment1))

(define segment2 (make-segment (make-point 1.0 2.0) (make-point 5.0 3.0)))
(print-point (midpoint-segment segment2))
