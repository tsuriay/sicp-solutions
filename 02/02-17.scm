(define (length list)
  (if (null? list)
	0
	(+ 1 (length (cdr list)))))

(define (last-pair list)
  (if (= 1 (length list))
	(car list)
	(last-pair (cdr list))))

(last-pair (list 7))
(last-pair (list 2 1 9))

