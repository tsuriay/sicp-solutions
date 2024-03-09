(define (compose f1 f2)
  (lambda (x) (f1 (f2 x))))

(define (square x) (* x x))

(define (repeated f n)
  (if (= n 1)
	f
	(compose f (repeated f (- n 1)))))

((repeated square 1) 5)
((repeated square 2) 5)
((repeated square 3) 5)
((repeated square 4) 5)
((repeated square 5) 5)

((compose square square) 5)
((compose square (compose square square)) 5)
((compose square (compose square (compose square square))) 5)
((compose square (compose square (compose square (compose square square)))) 5)
