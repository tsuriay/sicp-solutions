(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (iter-fast-multi a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (iter (double a) (halve b) acc))
          (else (iter a (- b 1) (+ a acc)))))

  (iter a b 0))

(iter-fast-multi 2 8)
(iter-fast-multi 2 9)
(iter-fast-multi 3 3)
(iter-fast-multi 100 100)
