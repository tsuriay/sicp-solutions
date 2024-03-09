(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (full-ferma-prime? n)
  (define (iter a n)
	(if (= a n)
	  true
	  (if (= (expmod a n n) a)
		(iter (+ a 1) n)
		false)))
  (iter 1 n))

(define (test-ferma-prime n expected)
  (define (report-result n result expected)
	(newline)
	(display n)
	(display ": ")
	(display result)
	(display ": ")
	(display (if (eq? result expected) "OK" "FOOLED")))

  (report-result n (full-ferma-prime? n) expected))

(test-ferma-prime 2 true)
(test-ferma-prime 13 true)
(test-ferma-prime 14 false)

(test-ferma-prime 561 false)
(test-ferma-prime 1105 false)
(test-ferma-prime 1729 false)
(test-ferma-prime 2465 false)
(test-ferma-prime 2821 false)
(test-ferma-prime 6601 false)
