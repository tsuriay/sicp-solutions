(define (same-parity x . z)
  (define (iter-same-parity x z result)
	(cond ((null? z) result)
		  ((even? x) (iter-same-parity x (cdr z) (if (even? (car z)) (append result (list (car z))) result))) 
		  (else (iter-same-parity x (cdr z) (if (even? (car z)) result (append result (list (car z))))))))

  (iter-same-parity x z (list x)))


(same-parity 1 2 3 4 5 6 7 8 9)
(same-parity 2 3 4 5 6 7 8 9 10)


(define (add-to-end-list l item)
  (append l (list item)))


(define (get-odd-items l)
  (define (odd-filter l filtered)
	(if (null? l)
	  filtered
	  (odd-filter (cdr l) (if (odd? (car l))
							(add-to-end-list filtered (car l))
							filtered))))

  (odd-filter l '()))

(define (get-even-items l)
  (define (even-filter l filtered)
	(if (null? l)
	  filtered
	  (even-filter (cdr l) (if (even? (car l))
							 (add-to-end-list filtered (car l))
							 filtered))))

  (even-filter l '()))


(define (same-parity2 x . z)
  (if (even? x)
	(cons x (get-even-items z))
	(cons x (get-odd-items z))))


(same-parity2 1 2 3 4 5 6 7 8 9)
(same-parity2 2 3 4 5 6 7 8 9 10)
