; recursice process
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
	null-value
	(if (filter a)
	  (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
	  (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum-combiner a b) (+ a b))
(define (even? x)
  (= (remainder x 2) 0))
(define (odd? x)
  (= (remainder x 2) 1))


(define (sum-even a b)
  (filtered-accumulate sum-combiner 0 identity a inc b even?))
(define (sum-odd a b)
  (filtered-accumulate sum-combiner 0 identity a inc b odd?))

(sum-even 1 10)
(sum-odd 1 10)


