(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime (- (runtime) start-time) n)
	#f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2)
	3
	(+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= (remainder n 2) 0))

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
