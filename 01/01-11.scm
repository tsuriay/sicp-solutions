(define (f-rec n)
  (if (< n 3)
    n
    (+ (f-rec (- n 1)) (f-rec (- n 2)) (f-rec (- n 3)))))

(define (f-iter-runner n)
  (define (f-iter a b c count)
    (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))))

  (f-iter 2 1 0 n))


(f-rec 3)
(f-iter-runner 3)

(f-rec 4)
(f-iter-runner 4)

(f-rec 5)
(f-iter-runner 5)

(f-rec 8)
(f-iter-runner 8)

(f-rec 15)
(f-iter-runner 15)
