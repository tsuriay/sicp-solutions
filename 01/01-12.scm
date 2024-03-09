(define (pascal row column)
  (if (or (= column 1) (= column row))
      1
      (+ (pascal (- row 1) (- column 1))
        (pascal (- row 1) column))))

(pascal 3 2)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
