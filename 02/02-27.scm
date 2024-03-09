(define nil '())

(define (reverse l)
  (define (iter l reversed)
	(if (null? l)
	  reversed
	  (iter (cdr l) (cons (car l) reversed))))

  (iter l '()))

(define (reverce-rec l)
  (if (null? l)
	l
	(append (reverce-rec (cdr l)) (list (car l)))))

(reverse (list 1 2 3 4 5))
(reverce-rec (list 1 2 3 4 5))


; ################################################################################


(define (deep-reverse l)
  (define (iter l reversed)
	(cond ((null? l) reversed)
		  ((pair? (car l)) (iter (cdr l) (cons (deep-reverse (car l)) reversed)))
		  (else (iter (cdr l) (cons (car l) reversed)))))

  (iter l '()))


(deep-reverse (list 1 2 3 4 5))
(deep-reverse (list (list 1 2 3) (list 4 5 6)))
(deep-reverse (list (list 1 2) (list 3 4) (list 5 6)))
(deep-reverse (list (list 1 2) 3 (list 4 5)))


(define (deep-reverse-rec l)
  (if (null? l)
	'()
	(append (deep-reverse-rec (cdr l)) (if (pair? (car l))
										 (list (deep-reverse-rec (car l)))
										 (list (car l))))))

(deep-reverse-rec (list 1 2 3 4 5))
(deep-reverse-rec (list (list 1 2) (list 3 4) (list 5 6)))
(deep-reverse-rec (list (list 1 2) 3 (list 4 5)))


; ################################################################################


(define (dr2 l)
  (if (pair? l)
	(append (dr2 (cdr l)) (list (dr2 (car l))))
	l))

(dr2 (list 1 2 3))
(dr2 (list (list 1 2) 3 (list 4 5)))
(dr2 (list (list 1 2) (list 3 4) (list 5 6)))
