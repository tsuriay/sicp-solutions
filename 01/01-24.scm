(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
	(report-prime (- (runtime) start-time) n)
	#f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (divides? a b)
  (= (remainder b a) 0))

(define (even? n)
  (= (remainder n 2) 0))



(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp)
		   (remainder (square (expmod base (/ exp 2) m))
					  m))
		  (else
			(remainder (* base (expmod base (- exp 1) m))
					   m))))

(define (ferma-test n)
  (define (try-it a)
	(= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
		((ferma-test n) (fast-prime? n (- times 1)))
		(else false)))



(define (search-for-primes from counter)
	(define (iter n counter)
	  (if (> counter 0)
		(if (timed-prime-test n)
		  (iter (+ n 2) (- counter 1))
		  (iter (+ n 2) counter))))
	(iter (if (odd? from) from (+ from 1)) counter))


(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)
(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
(search-for-primes 1000000000000000000 3)
