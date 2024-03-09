(define (enumerate-tree tree)
  (cond ((null? tree) tree)
		((not (pair? tree)) (list tree))
		(else (append (enumerate-tree (car tree))
					  (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ y 1))  0 (enumerate-tree t)))

(define x (cons (list 1 2) (list 3 4)))
(define xx (list x x))

(count-leaves x)
(count-leaves xx)

(define (2count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(2count-leaves x)
(2count-leaves xx)
