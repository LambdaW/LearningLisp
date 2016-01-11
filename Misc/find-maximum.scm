(define double
	(lambda (x)
		(* 2 x)
		))

(define bigger
	(lambda (x y)
		( if (> x y) x
			y)))


(define (find-maximum f low high) 
	(if (= low high) (f low) 
		(bigger (f low) (find-maximum f (+ low 1) high))))
