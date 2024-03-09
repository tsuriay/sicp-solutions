(define (cons x y)
  (lambda (m) (m x y)))

(define (car f)
  (f (lambda (x y) x)))

(define (cdr f)
  (f (lambda (x y) y)))


(define point1 (cons 5 7))

(car point1)
(cdr point1)

(define point2 (cons 3 9))
(car point2)
(cdr point2)
