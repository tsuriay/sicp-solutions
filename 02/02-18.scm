(define (reverse l)
  (define (reverse-iter l reversed-list)
	(if (null? l)
	  reversed-list
	  (reverse-iter (cdr l) (cons (car l) reversed-list))))

  (reverse-iter (cdr l) (list (car l))))


(reverse (list 1 2 3))
(reverse (list 1 2 3 4 5 6))
