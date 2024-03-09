(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-multi a (halve b))))
        (else (+ a (fast-multi a (- b 1))))))

(fast-multi 2 8)
(fast-multi 2 9)
