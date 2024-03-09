(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))


(define b1 (make-branch 1 11))
(define b2 (make-branch 2 22))

(define mobile1 (make-mobile b1 b2))

(branch-length (left-branch mobile1))
(branch-length (right-branch mobile1))

(branch-structure (left-branch mobile1))
(branch-structure (right-branch mobile1))

(define b2-r (make-branch 1 5))
(define b2-l (make-branch 1 5))

(define mobile2 (make-mobile b2-l b2-r))

(define b3-l (make-branch 1 3))
(define b3-r (make-branch 1 mobile2))

(define mobile3 (make-mobile b3-l b3-r))


(define (total-weight mobile)
  (let ((left-structure (branch-structure (left-branch mobile)))
		(right-structure (branch-structure (right-branch mobile))))
	(+ (if (number? left-structure)
		 left-structure
		 (total-weight left-structure))
	   (if (number? right-structure)
		 right-structure
		 (total-weight right-structure)))))

(total-weight mobile3)

(define (rotate-moment branch)
  (if (number? (branch-structure branch))
	(* (branch-length branch) (branch-structure branch))
	(* (branch-length branch) (+ (rotate-moment (left-branch (branch-structure branch))) (rotate-moment (right-branch (branch-structure branch)))))))

(define (balanced-mobile? mobile)
  (= (rotate-moment (left-branch mobile)) (rotate-moment (right-branch mobile))))

(balanced-mobile? mobile1)
(balanced-mobile? mobile2)

(define mobile4 (make-mobile (make-branch 2 mobile2) (make-branch 2 mobile2)))

(balanced-mobile? mobile4)

(define mobile5 (make-mobile (make-branch 3 mobile2) (make-branch 2 mobile2)))

(balanced-mobile? mobile5)

