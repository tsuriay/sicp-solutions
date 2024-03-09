(define (make-center-percent c p)
  (make-interval (- c (/ (* c p) 100))
				 (+ c (/ (* c p) 100))))

(define (percent interval)
  (* (/ (width interval) (center interval)) 100))


