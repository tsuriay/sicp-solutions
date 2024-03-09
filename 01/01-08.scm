(define (3root-iter guess x)
  (if (good-enough? guess x)
      guess
      (3root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x) (* x x))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (3root x)
  (3root-iter 1.1 x))

(3root 8)

(3root 27)

(3root 0.008)
