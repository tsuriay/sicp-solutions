;(define (sum term a next b)
;  (if (> a b)
;	0
;	(+ (term a)
;	   (sum term (next a) next b))))


(define (sum term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (+ (term a) result))))

  (iter a 0))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (sum-int a b)
  (sum identity a inc b))

(sum-int 1 10)



(define (cube x) (* x x x))



(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
	 dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
	

(define (simpson-integral f a b n)
  (define (term x)
	(+ (f x) (* 4 (f (+ x h))) (f (+ x (* 2 h)))))
  (define (next x)
	(+ x (* 2 h)))
  (define h (/ (- b a) n))

  (* (/ h 3) (sum term a next (- b (* 2 h)))))

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
