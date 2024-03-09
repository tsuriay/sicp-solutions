(define (square-sum a b) (+ (* a a) (* b b)))

(define (max-square-sum a b c)
  (cond ((and (>= a c) (>= b c)) (square-sum a b))
      	((and (>= a b) (>= c b)) (square-sum a c))
      	(else (square-sum b c))))

(max-square-sum 1 2 3)
(max-square-sum 1 1 1)
(max-square-sum 1 2 2)
(max-square-sum 1 1 2)
(max-square-sum 1 4 3)
(max-square-sum 4 1 3)
(max-square-sum 4 3 1)
