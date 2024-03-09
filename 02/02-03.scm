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

(define (make-point-rect tl tr bl br)
	(cons (make-segment bl tl) (make-segment tl tr)))


(define (rect-width rect)
	(let ((width-segment (cdr rect)))
	  (- (x-point (end-segment width-segment)) (x-point (start-segment width-segment)))))


(define (rect-height rect)
  (let ((height-segment (car rect)))
	(- (y-point (end-segment height-segment)) (y-point (start-segment height-segment)))))

(define (rect-square rect)
  (* (rect-width rect) (rect-height rect)))

(define (rect-perimeter rect)
  (* 2 (+ (rect-width rect) (rect-height rect))))


(define tl-point (make-point 1 6))
(define tr-point (make-point 6 6))
(define br-point (make-point 6 1))
(define bl-point (make-point 1 1))

(define rect1 (make-point-rect tl-point tr-point bl-point br-point))

(rect-square rect1)
(rect-perimeter rect1)
