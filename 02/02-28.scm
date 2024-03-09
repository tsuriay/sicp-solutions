(define x (list (list 1 2) (list 3 4)))


(define (append2end l e)
  (append l (list e)))


(define (fringe-iter l)
  (define (iter l result)
	(cond ((null? l) result)
		  ((pair? (car l)) (append (fringe-iter (car l)) (fringe-iter (cdr l))))
		  (else (iter (cdr l) (append2end result (car l))))))

  (iter l '()))


(fringe-iter x)
(fringe-iter (list x x))







(define (fringe l)
  (cond ((null? l) l)
		((pair? (car l)) (append (fringe (car l)) (fringe (cdr l))))
		(else (cons (car l) (fringe (cdr l))))))



(fringe (list 1 2 3 4))
(fringe x)
(fringe (list x x))
(fringe (list (list x x) (list (list 11 12) (list 13 14))))
(fringe (list 1 (list 2 (list 3 4) (list 5 6)) (list 7 (list 8))))
