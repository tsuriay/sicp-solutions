(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))


(sqrt 9)

(sqrt (+ 100 37))

(square (sqrt 1000))

(sqrt 0.0001)

(sqrt 1000000000000)

(sqrt 10000000000000)

