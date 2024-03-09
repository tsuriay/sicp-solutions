(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
	'()
	(cons (accumulate op init (map (lambda (x) (car x)) seqs))
		  (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
	(map (lambda (x) (matrix-*-vector cols x)) m)))

(define matrix1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vector1 (list 10 2 2 10))

(define matrix2 (list (list 2 4 0) (list -2 1 3) (list -1 0 1)))
(define vector2 (list 1 2 -1))

(define matrix3-1 (list (list 1 2 2) (list 3 1 1)))
(define matrix3-2 (list (list 4 2) (list 3 1) (list 1 5)))

(dot-product vector1 vector1)

(matrix-*-vector matrix1 vector1)
(matrix-*-vector matrix2 vector2)

(transpose matrix1)

(matrix-*-matrix matrix3-1 matrix3-2)
