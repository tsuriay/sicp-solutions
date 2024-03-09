(define (square x) (* x x))

(define (tree-map f tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		   (tree-map f sub-tree)
		   (f sub-tree)))
	   tree))

(define l1 (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree tree) (tree-map square tree))

(square-tree l1)
