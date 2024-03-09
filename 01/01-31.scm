(define (product term a next b)
  (if (> a b)
	1
	(* (term a)
	   (product term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial a b)
  (product identity a inc b))

(factorial 1 1)
(factorial 1 3)
(factorial 1 5)
(factorial 1 6)


(define (product-iter term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (* (term a) result))))

  (iter a 1))

(define (factorial-iter a b)
  (product-iter identity a inc b))

(factorial-iter 1 1)
(factorial-iter 1 3)
(factorial-iter 1 5)
(factorial-iter 1 6)

