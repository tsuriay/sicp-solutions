; recursice process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
	null-value
	(combiner (term a) (accumulate combiner null-value term (next a) next b))))


(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum-combiner a b) (+ a b))
(define (product-combiner a b) (* a b))

(define (sum a b)
  (accumulate sum-combiner 0 identity a inc b))

(sum 1 10)

(define (product a b)
  (accumulate product-combiner 1 identity a inc b))

(product 1 5)
(product 1 6)

; iterative process
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (combiner (term a) result))))

  (iter a null-value))

(define (sum-iter a b)
  (accumulate-iter sum-combiner 0 identity a inc b))

(sum-iter 1 10)

(define (product-iter a b)
  (accumulate-iter product-combiner 1 identity a inc b))

(product-iter 1 5)
(product-iter 1 6)

