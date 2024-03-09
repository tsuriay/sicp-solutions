(define nil '())

(define (square-list1 items)
  (if (null? items)
	nil
	(cons (* (car items) (car items)) (square-list1 (cdr items)))))

(square-list1 (list 1 2 3 4 5))


(define (map proc items)
  (if (null? items)
	nil
	(cons (proc (car items))
		  (map proc (cdr items)))))

(define (square x)
  (* x x))

(define (square-list2 items)
  (map square items))

(square-list2 (list 1 2 3 4 5))
  
