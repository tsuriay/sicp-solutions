(define (average a b c) (/ (+ a b c) 3))
(define (inc x) (+ x 1))

(define (smooth f)
  (define dx 0.2)
  (lambda (x)
	(average
	  (f (- x dx))
	  (f x)
	  (f (+ x dx)))))

(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

(define (repeated f n)
  (if (= n 1)
	f
	(compose f (repeated f (- n 1)))))

(define (repeated-smooth f n)
  ((repeated smooth n) f))


((smooth inc) 3)
(((repeated smooth 2) inc) 3)

((repeated-smooth inc 3) 3)

