(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 2)
(fast-expt 2 4)
(fast-expt 2 8)
(fast-expt 2 16)
(fast-expt 2 32)

(define (iter-fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* b a)))))

  (iter b n 1))

(iter-fast-expt 2 2)
(iter-fast-expt 2 4)
(iter-fast-expt 2 8)
(iter-fast-expt 2 32)
