(define (fold-right op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(fold-right op initial (cdr sequence)))))

(define (reverse-by-fr sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))


(define (fold-left op initial sequence)
	(define (iter result rest)
	  (if (null? rest)
		result
		(iter (op result (car rest))
			  (cdr rest))))
	(iter initial sequence))

(define (reverse-by-fl sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(reverse-by-fr (list 1 2 3 4 5))
(reverse-by-fl (list 1 2 3 4 5))
